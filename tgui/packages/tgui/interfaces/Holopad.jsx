import {
  Box,
  Button,
  Flex,
  Icon,
  LabeledList,
  Modal,
  NoticeBox,
  Section,
} from 'tgui-core/components';

import { useBackend } from '../backend';
import { Window } from '../layouts';

export const Holopad = (props) => {
  const { act, data } = useBackend();
  const { calling } = data;
  return (
    <Window width={440} height={245}>
      {!!calling && (
        <Modal fontSize="36px" fontFamily="monospace">
          <Flex align="center">
            <Flex.Item mr={2} mt={2}>
              <Icon name="phone-alt" rotation={25} />
            </Flex.Item>
            <Flex.Item mr={2}>{'Вызов...'}</Flex.Item>
          </Flex>
          <Box mt={2} textAlign="center" fontSize="24px">
            <Button
              lineHeight="40px"
              icon="times"
              content="Завершить"
              color="bad"
              onClick={() => act('hang_up')}
            />
          </Box>
        </Modal>
      )}
      <Window.Content scrollable>
        <HolopadContent />
      </Window.Content>
    </Window>
  );
};

const HolopadContent = (props) => {
  const { act, data } = useBackend();
  const {
    on_network,
    on_cooldown,
    allowed,
    disk,
    disk_record,
    replay_mode,
    loop_mode,
    record_mode,
    holo_calls = [],
  } = data;
  return (
    <>
      <Section
        title="Голопад"
        buttons={
          <Button
            icon="bell"
            content={
              on_cooldown ? 'Присутствие ИИ запрошено' : 'Запросить присутствие ИИ'
            }
            disabled={!on_network || on_cooldown}
            onClick={() => act('AIrequest')}
          />
        }
      >
        <LabeledList>
          <LabeledList.Item label="Коммуникатор">
            <Button
              icon="phone-alt"
              content={allowed ? 'Подключиться к голопаду' : 'Вызвать голопад'}
              disabled={!on_network}
              onClick={() => act('holocall', { headcall: allowed })}
            />
          </LabeledList.Item>
          {holo_calls.map((call) => {
            return (
              <LabeledList.Item
                label={call.connected ? 'Текущий вызов' : 'Входящий вызов'}
                key={call.ref}
              >
                <Button
                  icon={call.connected ? 'phone-slash' : 'phone-alt'}
                  content={
                    call.connected
                      ? `Отключить вызов от ${call.caller}`
                      : `Ответить на вызов от ${call.caller}`
                  }
                  color={call.connected ? 'bad' : 'good'}
                  disabled={!on_network}
                  onClick={() =>
                    act(call.connected ? 'disconnectcall' : 'connectcall', {
                      holopad: call.ref,
                    })
                  }
                />
              </LabeledList.Item>
            );
          })}
          {holo_calls.filter((call) => !call.connected).length > 0 && (
            <LabeledList.Item key="reject">
              <Button
                icon="phone-slash"
                content="Отклонить входящие вызовы"
                color="bad"
                onClick={() => act('rejectall')}
              />
            </LabeledList.Item>
          )}
        </LabeledList>
      </Section>
      <Section
        title="Голодиск"
        buttons={
          <Button
            icon="eject"
            content="Извлечь"
            disabled={!disk || replay_mode || record_mode}
            onClick={() => act('disk_eject')}
          />
        }
      >
        {(!disk && <NoticeBox>Голодиск отсутствует</NoticeBox>) || (
          <LabeledList>
            <LabeledList.Item label="Проигрыватель">
              <Button
                icon={replay_mode ? 'pause' : 'play'}
                content={replay_mode ? 'Остановить' : 'Воспроизвести'}
                selected={replay_mode}
                disabled={record_mode || !disk_record}
                onClick={() => act('replay_mode')}
              />
              <Button
                icon={'sync'}
                content={loop_mode ? 'Повтор включен' : 'Повтор'}
                selected={loop_mode}
                disabled={record_mode || !disk_record}
                onClick={() => act('loop_mode')}
              />
              <Button
                icon="exchange-alt"
                content="Сменить смещение"
                disabled={!replay_mode}
                onClick={() => act('offset')}
              />
            </LabeledList.Item>
            <LabeledList.Item label="Запись">
              <Button
                icon={record_mode ? 'pause' : 'video'}
                content={record_mode ? 'Завершить запись' : 'Записать'}
                selected={record_mode}
                disabled={(disk_record && !record_mode) || replay_mode}
                onClick={() => act('record_mode')}
              />
              <Button
                icon="trash"
                content="Очистить запись"
                color="bad"
                disabled={!disk_record || replay_mode || record_mode}
                onClick={() => act('record_clear')}
              />
            </LabeledList.Item>
          </LabeledList>
        )}
      </Section>
    </>
  );
};
