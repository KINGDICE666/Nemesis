import {
  Button,
  LabeledList,
  NumberInput,
  Section,
} from 'tgui-core/components';

import { useBackend } from '../backend';
import { Window } from '../layouts';

export const GulagTeleporterConsole = (props) => {
  const { act, data } = useBackend();
  const {
    teleporter,
    teleporter_lock,
    teleporter_state_open,
    teleporter_location,
    beacon,
    beacon_location,
    id,
    id_name,
    can_teleport,
    goal = 0,
    prisoner = {},
  } = data;
  return (
    <Window width={350} height={295}>
      <Window.Content>
        <Section
          title="Консоль телепортера"
          buttons={
            <>
              <Button
                content={teleporter_state_open ? 'Открыт' : 'Закрыт'}
                disabled={teleporter_lock}
                selected={teleporter_state_open}
                onClick={() => act('toggle_open')}
              />
              <Button
                icon={teleporter_lock ? 'lock' : 'unlock'}
                content={teleporter_lock ? 'Заблокирован' : 'Разблокирован'}
                selected={teleporter_lock}
                disabled={teleporter_state_open}
                onClick={() => act('teleporter_lock')}
              />
            </>
          }
        >
          <LabeledList>
            <LabeledList.Item
              label="Телепортер"
              color={teleporter ? 'good' : 'bad'}
              buttons={
                !teleporter && (
                  <Button
                    content="Переподключить"
                    onClick={() => act('scan_teleporter')}
                  />
                )
              }
            >
              {teleporter ? teleporter_location : 'Нет соединения'}
            </LabeledList.Item>
            <LabeledList.Item
              label="Приемный маяк"
              color={beacon ? 'good' : 'bad'}
              buttons={
                !beacon && (
                  <Button
                    content="Переподключить"
                    onClick={() => act('scan_beacon')}
                  />
                )
              }
            >
              {beacon ? beacon_location : 'Нет соединения'}
            </LabeledList.Item>
          </LabeledList>
        </Section>
        <Section title="Данные заключенного">
          <LabeledList>
            <LabeledList.Item label="ID заключенного">
              <Button
                fluid
                content={id ? id_name : 'Нет ID'}
                onClick={() => act('handle_id')}
              />
            </LabeledList.Item>
            <LabeledList.Item label="Цель очков">
              <NumberInput
                value={goal}
                step={1}
                width="48px"
                minValue={1}
                maxValue={1000}
                onChange={(value) => act('set_goal', { value })}
              />
            </LabeledList.Item>
            <LabeledList.Item label="Внутри">
              {prisoner.name || 'Никого нет'}
            </LabeledList.Item>
            <LabeledList.Item label="Криминальный статус">
              {prisoner.crimstat || 'Нет статуса'}
            </LabeledList.Item>
          </LabeledList>
        </Section>
        <Button
          fluid
          content="Обработать заключенного"
          disabled={!can_teleport}
          textAlign="center"
          color="bad"
          onClick={() => act('teleport')}
        />
      </Window.Content>
    </Window>
  );
};
