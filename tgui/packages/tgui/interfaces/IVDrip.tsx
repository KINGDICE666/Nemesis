import {
  Box,
  Button,
  LabeledList,
  NoticeBox,
  ProgressBar,
  Section,
  Slider,
  Tooltip,
} from 'tgui-core/components';
import type { BooleanLike } from 'tgui-core/react';

import { useBackend } from '../backend';
import { Window } from '../layouts';

type IVDripData = {
  hasInternalStorage: BooleanLike;
  hasContainer: BooleanLike;
  canRemoveContainer: BooleanLike;
  mode: BooleanLike;
  canDraw: BooleanLike;
  injectFromPlumbing: BooleanLike;
  canAdjustTransfer: BooleanLike;
  transferRate: number;
  transferStep: number;
  minTransferRate: number;
  maxTransferRate: number;
  hasObjectAttached: BooleanLike;
  objectName: string;
  containerReagentColor: string;
  containerCurrentVolume: number;
  containerMaxVolume: number;
};

enum MODE {
  drawing,
  injecting,
}

export const IVDrip = (props) => {
  const { act, data } = useBackend<IVDripData>();
  const {
    hasContainer,
    canRemoveContainer,
    mode,
    canDraw,
    hasInternalStorage,
    transferRate,
    transferStep,
    maxTransferRate,
    minTransferRate,
    hasObjectAttached,
    objectName,
    containerCurrentVolume,
    containerMaxVolume,
    containerReagentColor,
  } = data;
  return (
    <Window width={400} height={220}>
      <Window.Content>
        <Section fill>
          <LabeledList>
            <LabeledList.Item
              label="Скорость потока"
              buttons={
                <Box>
                  <Button
                    width={4}
                    lineHeight={2}
                    align="center"
                    icon="angles-left"
                    onClick={() =>
                      act('changeRate', {
                        rate: minTransferRate,
                      })
                    }
                  />
                  <Button
                    width={4}
                    lineHeight={2}
                    align="center"
                    icon="angles-right"
                    onClick={() =>
                      act('changeRate', {
                        rate: maxTransferRate,
                      })
                    }
                  />
                </Box>
              }
            >
              <Slider
                step={transferStep}
                my={1}
                value={transferRate}
                minValue={minTransferRate}
                maxValue={maxTransferRate}
                unit="ед./сек."
                onChange={(e, value) =>
                  act('changeRate', {
                    rate: value,
                  })
                }
              />
            </LabeledList.Item>
            <LabeledList.Item
              label="Направление"
              color={!mode ? 'bad' : ''}
              buttons={
                <Button
                  my={1}
                  width={8}
                  lineHeight={2}
                  align="center"
                  disabled={!canDraw}
                  color={!mode && 'bad'}
                  content={mode ? 'Введение' : 'Слив'}
                  icon={mode ? 'syringe' : 'droplet'}
                  onClick={() => act('changeMode')}
                />
              }
            >
              {mode
                ? hasInternalStorage
                  ? 'Реагенты из сети'
                  : 'Реагенты из контейнера'
                : 'Кровь в контейнер'}
            </LabeledList.Item>
            {hasContainer || hasInternalStorage ? (
              <LabeledList.Item
                label="Контейнер"
                buttons={
                  !hasInternalStorage &&
                  !!canRemoveContainer && (
                    <Button
                      my={1}
                      width={8}
                      lineHeight={2}
                      align="center"
                      icon="eject"
                      content="Извлечь"
                      onClick={() => act('eject')}
                    />
                  )
                }
              >
                <ProgressBar
                  value={containerCurrentVolume}
                  minValue={0}
                  maxValue={containerMaxVolume}
                  color={containerReagentColor}
                >
                  <span
                    style={{
                      textShadow: '1px 1px 0 black',
                    }}
                  >
                    {`${containerCurrentVolume} из ${containerMaxVolume} ед.`}
                  </span>
                </ProgressBar>
              </LabeledList.Item>
            ) : (
              <LabeledList.Item label="Контейнер">
                <Tooltip content="Кликните по капельнице с контейнером в руке, чтобы закрепить его.">
                  <NoticeBox my={0.7}>Контейнер не подключен.</NoticeBox>
                </Tooltip>
              </LabeledList.Item>
            )}
            {hasObjectAttached ? (
              <LabeledList.Item
                label="Объект"
                buttons={
                  <Button
                    disabled={!hasObjectAttached}
                    my={1}
                    width={8}
                    lineHeight={2}
                    align="center"
                    icon="ban"
                    content="Отсоединить"
                    onClick={() => act('detach')}
                  />
                }
              >
                <Box maxHeight={'45px'} overflow={'hidden'}>
                  {objectName}
                </Box>
              </LabeledList.Item>
            ) : (
              <LabeledList.Item label="Объект">
                <Tooltip content="Потяните курсор от капельницы и отпустите на объекте, чтобы подключить.">
                  <NoticeBox my={0.7}>Объект не подключен.</NoticeBox>
                </Tooltip>
              </LabeledList.Item>
            )}
          </LabeledList>
        </Section>
      </Window.Content>
    </Window>
  );
};
