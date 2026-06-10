import { Button, LabeledList, Section } from 'tgui-core/components';

import { useBackend } from '../backend';
import { Window } from '../layouts';

const dangerMap = {
  2: {
    color: 'good',
    localStatusText: 'Отключено',
  },
  1: {
    color: 'average',
    localStatusText: 'Внимание',
  },
  0: {
    color: 'bad',
    localStatusText: 'Оптимально',
  },
};

export const AiAirlock = (props) => {
  const { act, data } = useBackend();
  const statusMain = dangerMap[data.power.main] || dangerMap[0];
  const statusBackup = dangerMap[data.power.backup] || dangerMap[0];
  const statusElectrify = dangerMap[data.shock] || dangerMap[0];
  return (
    <Window width={500} height={390}>
      <Window.Content>
        <Section title="Состояние питания">
          <LabeledList>
            <LabeledList.Item
              label="Основное"
              color={statusMain.color}
              buttons={
                <Button
                  icon="lightbulb-o"
                  disabled={!data.power.main}
                  content="Отключить"
                  onClick={() => act('disrupt-main')}
                />
              }
            >
              {data.power.main ? 'В сети' : 'Отключено'}{' '}
              {((!data.wires.main_1 || !data.wires.main_2) &&
                '[Провода перерезаны!]') ||
                (data.power.main_timeleft > 0 &&
                  `[${data.power.main_timeleft}s]`)}
            </LabeledList.Item>
            <LabeledList.Item
              label="Резервное"
              color={statusBackup.color}
              buttons={
                <Button
                  icon="lightbulb-o"
                  disabled={!data.power.backup}
                  content="Отключить"
                  onClick={() => act('disrupt-backup')}
                />
              }
            >
              {data.power.backup ? 'В сети' : 'Отключено'}{' '}
              {((!data.wires.backup_1 || !data.wires.backup_2) &&
                '[Провода перерезаны!]') ||
                (data.power.backup_timeleft > 0 &&
                  `[${data.power.backup_timeleft}s]`)}
            </LabeledList.Item>
            <LabeledList.Item
              label="Электрификация"
              color={statusElectrify.color}
              buttons={
                <>
                  <Button
                    icon="wrench"
                    disabled={!(data.wires.shock && data.shock === 0)}
                    content="Снять"
                    onClick={() => act('shock-restore')}
                  />
                  <Button
                    icon="bolt"
                    disabled={!data.wires.shock}
                    content="Временно"
                    onClick={() => act('shock-temp')}
                  />
                  <Button
                    icon="bolt"
                    disabled={!data.wires.shock}
                    content="Постоянно"
                    onClick={() => act('shock-perm')}
                  />
                </>
              }
            >
              {data.shock === 2 ? 'Безопасно' : 'Под напряжением'}{' '}
              {(!data.wires.shock && '[Провода перерезаны!]') ||
                (data.shock_timeleft > 0 && `[${data.shock_timeleft}s]`) ||
                (data.shock_timeleft === -1 && '[Постоянно]')}
            </LabeledList.Item>
          </LabeledList>
        </Section>
        <Section title="Доступ и управление дверью">
          <LabeledList>
            <LabeledList.Item
              label="Сканер ID"
              color="bad"
              buttons={
                <Button
                  icon={data.id_scanner ? 'power-off' : 'times'}
                  content={data.id_scanner ? 'Включен' : 'Отключен'}
                  selected={data.id_scanner}
                  disabled={!data.wires.id_scanner}
                  onClick={() => act('idscan-toggle')}
                />
              }
            >
              {!data.wires.id_scanner && '[Провода перерезаны!]'}
            </LabeledList.Item>
            <LabeledList.Item
              label="Аварийный доступ"
              buttons={
                <Button
                  icon={data.emergency ? 'power-off' : 'times'}
                  content={data.emergency ? 'Включен' : 'Отключен'}
                  selected={data.emergency}
                  onClick={() => act('emergency-toggle')}
                />
              }
            />
            <LabeledList.Divider />
            <LabeledList.Item
              label="Болты двери"
              color="bad"
              buttons={
                <Button
                  icon={data.locked ? 'lock' : 'unlock'}
                  content={data.locked ? 'Опущены' : 'Подняты'}
                  selected={data.locked}
                  disabled={!data.wires.bolts}
                  onClick={() => act('bolt-toggle')}
                />
              }
            >
              {!data.wires.bolts && '[Провода перерезаны!]'}
            </LabeledList.Item>
            <LabeledList.Item
              label="Индикация двери"
              color="bad"
              buttons={
                <Button
                  icon={data.feedback ? 'power-off' : 'times'}
                  content={data.feedback ? 'Включена' : 'Отключена'}
                  selected={data.feedback}
                  disabled={!data.wires.feedback}
                  onClick={() => act('light-toggle')}
                />
              }
            >
              {!data.wires.feedback && '[Провода перерезаны!]'}
            </LabeledList.Item>
            <LabeledList.Item
              label="Датчики усилия"
              color="bad"
              buttons={
                <Button
                  icon={data.safe ? 'power-off' : 'times'}
                  content={data.safe ? 'Включены' : 'Отключены'}
                  selected={data.safe}
                  disabled={!data.wires.safe}
                  onClick={() => act('safe-toggle')}
                />
              }
            >
              {!data.wires.safe && '[Провода перерезаны!]'}
            </LabeledList.Item>
            <LabeledList.Item
              label="Безопасность таймера"
              color="bad"
              buttons={
                <Button
                  icon={data.speed ? 'power-off' : 'times'}
                  content={data.speed ? 'Включена' : 'Отключена'}
                  selected={data.speed}
                  disabled={!data.wires.timing}
                  onClick={() => act('speed-toggle')}
                />
              }
            >
              {!data.wires.timing && '[Провода перерезаны!]'}
            </LabeledList.Item>
            <LabeledList.Divider />
            <LabeledList.Item
              label="Управление дверью"
              color="bad"
              buttons={
                <Button
                  icon={data.opened ? 'sign-out-alt' : 'sign-in-alt'}
                  content={data.opened ? 'Открыта' : 'Закрыта'}
                  selected={data.opened}
                  disabled={data.locked || data.welded}
                  onClick={() => act('open-close')}
                />
              }
            >
              {!!(data.locked || data.welded) && (
                <span>
                  [Дверь {data.locked ? 'на болтах' : ''}
                  {data.locked && data.welded ? ' и ' : ''}
                  {data.welded ? 'заварена' : ''}!]
                </span>
              )}
            </LabeledList.Item>
          </LabeledList>
        </Section>
      </Window.Content>
    </Window>
  );
};
