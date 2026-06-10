import {
  Box,
  Button,
  LabeledList,
  NoticeBox,
  Section,
} from 'tgui-core/components';

import { useBackend } from '../backend';
import { Window } from '../layouts';

export const StackingConsole = (props) => {
  const { act, data } = useBackend();
  const { machine } = data;
  return (
    <Window width={320} height={340}>
      <Window.Content scrollable>
        {!machine ? (
          <NoticeBox>Укладчик не подключен</NoticeBox>
        ) : (
          <StackingConsoleContent />
        )}
      </Window.Content>
    </Window>
  );
};

export const StackingConsoleContent = (props) => {
  const { act, data } = useBackend();
  const {
    input_direction,
    output_direction,
    stacking_amount,
    contents = [],
  } = data;
  return (
    <>
      <Section>
        <LabeledList>
          <LabeledList.Item label="Размер стопки">
            {stacking_amount || 'Неизвестно'}
          </LabeledList.Item>
          <LabeledList.Item
            label="Вход"
            buttons={
              <Button
                icon="rotate"
                content="Повернуть"
                onClick={() =>
                  act('rotate', {
                    input: 1,
                  })
                }
              />
            }
          >
            <Box style={{ textTransform: 'capitalize' }}>{input_direction}</Box>
          </LabeledList.Item>
          <LabeledList.Item
            label="Выход"
            buttons={
              <Button
                icon="rotate"
                content="Повернуть"
                onClick={() =>
                  act('rotate', {
                    input: 0,
                  })
                }
              />
            }
          >
            <Box style={{ textTransform: 'capitalize' }}>
              {output_direction}
            </Box>
          </LabeledList.Item>
        </LabeledList>
      </Section>
      <Section title="Сохраненные материалы">
        {!contents.length ? (
          <NoticeBox>Материалы не сохранены</NoticeBox>
        ) : (
          <LabeledList>
            {contents.map((sheet) => (
              <LabeledList.Item
                key={sheet.type}
                label={sheet.name}
                buttons={
                  <Button
                    icon="eject"
                    content="Выпустить"
                    onClick={() =>
                      act('release', {
                        type: sheet.type,
                      })
                    }
                  />
                }
              >
                {sheet.amount || 'Неизвестно'}
              </LabeledList.Item>
            ))}
          </LabeledList>
        )}
      </Section>
    </>
  );
};
