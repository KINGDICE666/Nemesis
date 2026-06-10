import {
  AnimatedNumber,
  Box,
  Button,
  LabeledList,
  Section,
} from 'tgui-core/components';
import type { BooleanLike } from 'tgui-core/react';

import { useBackend } from '../backend';
import { Window } from '../layouts';

type Data = {
  points: number;
  pad: string;
  sending: BooleanLike;
  status_report: string;
};

export const CargoHoldTerminal = (props) => {
  const { act, data } = useBackend<Data>();
  const { points, pad, sending, status_report } = data;

  return (
    <Window width={600} height={230}>
      <Window.Content scrollable>
        <Section>
          <LabeledList>
            <LabeledList.Item label="Текущая стоимость груза">
              <Box inline bold>
                <AnimatedNumber value={Math.round(points)} /> кредитов
              </Box>
            </LabeledList.Item>
          </LabeledList>
        </Section>
        <Section
          title="Грузовая площадка"
          buttons={
            <>
              <Button
                icon={'sync'}
                content={'Пересчитать стоимость'}
                disabled={!pad}
                onClick={() => act('recalc')}
              />
              <Button
                icon={sending ? 'times' : 'arrow-up'}
                content={sending ? 'Остановить отправку' : 'Отправить груз'}
                selected={sending}
                disabled={!pad}
                onClick={() => act(sending ? 'stop' : 'send')}
              />
            </>
          }
        >
          <LabeledList>
            <LabeledList.Item label="Статус" color={pad ? 'good' : 'bad'}>
              {pad ? 'В сети' : 'Не найдено'}
            </LabeledList.Item>
            <LabeledList.Item label="Отчет по грузу">
              {status_report}
            </LabeledList.Item>
          </LabeledList>
        </Section>
      </Window.Content>
    </Window>
  );
};
