import {
  Box,
  Button,
  Knob,
  LabeledControls,
  LabeledList,
  NoticeBox,
  RoundGauge,
  Section,
  Stack,
  Tabs,
} from 'tgui-core/components';
import { formatSiUnit } from 'tgui-core/format';
import { toFixed } from 'tgui-core/math';
import type { BooleanLike } from 'tgui-core/react';

import { useBackend, useSharedState } from '../backend';
import { Window } from '../layouts';

type Data = {
  // Dynamic
  tankPresent: BooleanLike;
  tankPressure: number;
  leaking: BooleanLike;
  active: BooleanLike;
  transferRate: number;
  lastPressure: number;
  disk: string;
  storage: string;
  records: GasRecord[];
  // Static
  maxTransfer: number;
  leakPressure: number;
  fragmentPressure: number;
  ejectPressure: number;
};

type GasRecord = {
  ref: string;
  name: string;
  timestamp: string;
  source: string;
  gases: Record<string, number>[];
};

const formatPressure = (value) => {
  if (value < 10000) {
    return `${toFixed(value)} kPa`;
  }
  return formatSiUnit(value * 1000, 1, 'Pa');
};

export const TankCompressor = (props) => {
  return (
    <Window title="Компрессор баллонов" width={440} height={440}>
      <Window.Content>
        <TankCompressorContent />
      </Window.Content>
    </Window>
  );
};

const TankCompressorContent = (props) => {
  const { act, data } = useBackend<Data>();
  const { disk, storage } = data;

  return (
    <Stack vertical fill>
      <TankCompressorControls />
      <Stack.Item grow>
        <Section
          scrollable
          fill
          style={{
            textTransform: 'capitalize',
          }}
          title={disk ? `${disk} (${storage})` : 'Диск не вставлен'}
          buttons={
            <Button
              icon="eject"
              disabled={!disk}
              onClick={() => act('eject_disk')}
            >
              Извлечь диск
            </Button>
          }
        >
          <TankCompressorRecords />
        </Section>
      </Stack.Item>
    </Stack>
  );
};

const TankCompressorControls = (props) => {
  const { act, data } = useBackend<Data>();
  const {
    tankPresent,
    leaking,
    lastPressure,
    leakPressure,
    fragmentPressure,
    tankPressure,
    maxTransfer,
    active,
    transferRate,
    ejectPressure,
  } = data;
  const pressure = tankPresent ? tankPressure : lastPressure;
  const usingLastData = !!(lastPressure && !tankPresent);
  const notice_color =
    usingLastData || leaking || pressure > fragmentPressure
      ? 'bad'
      : !tankPresent
        ? 'blue'
        : pressure > leakPressure
          ? 'average'
          : 'good';
  const notice_text = usingLastData
    ? 'Баллон разрушен. Показаны последние записанные данные.'
    : !tankPresent
      ? 'Баллон не обнаружен'
      : leaking
        ? 'Баллон протекает'
        : !pressure
          ? 'Давление не обнаружено'
          : pressure < leakPressure
            ? 'Давление баллона в норме'
            : pressure < fragmentPressure
              ? 'Опасность утечки'
              : 'Опасность взрыва';

  return (
    <Stack.Item>
      <Section
        title="Баллон"
        buttons={
          <Button
            icon="eject"
            disabled={!tankPresent || tankPressure > ejectPressure}
            onClick={() => act('eject_tank')}
          >
            {'Извлечь баллон'}
          </Button>
        }
      >
        <NoticeBox color={notice_color}>{notice_text}</NoticeBox>
        <LabeledControls p={2}>
          <LabeledControls.Item label="Давление">
            <RoundGauge
              size={2.5}
              value={pressure}
              minValue={0}
              maxValue={fragmentPressure * 1.15}
              alertAfter={leakPressure}
              ranges={{
                good: [0, leakPressure],
                average: [leakPressure, fragmentPressure],
                bad: [fragmentPressure, fragmentPressure * 1.15],
              }}
              format={formatPressure}
            />
          </LabeledControls.Item>
          <LabeledControls.Item label="Расход">
            <Box position="relative">
              <Knob
                size={2}
                value={transferRate}
                unit="л/с"
                minValue={0}
                maxValue={maxTransfer}
                step={1}
                stepPixelSize={8}
                onChange={(e, value) =>
                  act('change_rate', {
                    target: value,
                  })
                }
              />
              <Button
                fluid
                position="absolute"
                top="-2px"
                right="-24px"
                color="transparent"
                icon="fast-forward"
                onClick={() =>
                  act('change_rate', {
                    target: maxTransfer,
                  })
                }
              />
              <Button
                fluid
                position="absolute"
                top="16px"
                right="-24px"
                color="transparent"
                icon="undo"
                onClick={() =>
                  act('change_rate', {
                    target: 0,
                  })
                }
              />
            </Box>
          </LabeledControls.Item>
          <LabeledControls.Item label="Компрессор">
            <Button
              my={0.5}
              lineHeight={2}
              fontSize="18px"
              icon="power-off"
              disabled={!tankPresent || (!!leaking && pressure < leakPressure)}
              selected={active}
              onClick={() => act('toggle_injection')}
            >
              {active ? 'Вкл' : 'Выкл'}
            </Button>
          </LabeledControls.Item>
        </LabeledControls>
      </Section>
    </Stack.Item>
  );
};

const TankCompressorRecords = (props) => {
  const { act, data } = useBackend<Data>();
  const { records = [], disk } = data;
  const [activeRecordRef, setActiveRecordRef] = useSharedState(
    'recordRef',
    records[0]?.ref,
  );
  const activeRecord =
    !!activeRecordRef &&
    records.find((record) => activeRecordRef === record.ref);
  if (records.length === 0) {
    return (
      <Stack.Item grow>
        <NoticeBox>Нет записей</NoticeBox>
      </Stack.Item>
    );
  }

  return (
    <Stack.Item grow>
      <Stack fill>
        <Stack.Item mr={2}>
          <Tabs vertical>
            {records.map((record) => (
              <Tabs.Tab
                icon="file"
                key={record.name}
                selected={record.ref === activeRecordRef}
                onClick={() => setActiveRecordRef(record.ref)}
              >
                {record.name}
              </Tabs.Tab>
            ))}
          </Tabs>
        </Stack.Item>
        {activeRecord ? (
          <Stack.Item grow>
            <LabeledList>
              <LabeledList.Item label="Название">
                {activeRecord.name}
              </LabeledList.Item>
              <LabeledList.Item label="Время">
                {activeRecord.timestamp}
              </LabeledList.Item>
              <LabeledList.Item label="Источник">
                {activeRecord.source}
              </LabeledList.Item>
              <LabeledList.Item label="Газы">
                <LabeledList>
                  {Object.keys(activeRecord.gases).map((gas_name) => (
                    <LabeledList.Item label={gas_name} key={gas_name}>
                      {`${
                        activeRecord.gases[gas_name]
                          ? activeRecord.gases[gas_name].toFixed(2)
                          : '-'
                      } моль`}
                    </LabeledList.Item>
                  ))}
                </LabeledList>
              </LabeledList.Item>
              <LabeledList.Item label="Действия">
                <Button
                  icon="floppy-disk"
                  content="Сохранить на диск"
                  disabled={!disk}
                  tooltip="Сохранить выбранную запись на вставленный диск данных."
                  tooltipPosition="bottom"
                  onClick={() => {
                    act('save_record', {
                      ref: activeRecord.ref,
                    });
                  }}
                />
                <Button.Confirm
                  icon="trash"
                  color="bad"
                  onClick={() => {
                    act('delete_record', {
                      ref: activeRecord.ref,
                    });
                  }}
                />
              </LabeledList.Item>
            </LabeledList>
          </Stack.Item>
        ) : (
          <Stack.Item grow={1} basis={0}>
            <NoticeBox>Запись не выбрана</NoticeBox>
          </Stack.Item>
        )}
      </Stack>
    </Stack.Item>
  );
};
