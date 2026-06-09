import { Box, Section, Stack } from 'tgui-core/components';
import type { BooleanLike } from 'tgui-core/react';

import { useBackend } from '../backend';
import { Window } from '../layouts';
import {
  type Objective,
  ObjectivePrintout,
  ReplaceObjectivesButton,
} from './common/Objectives';

const teleportstyle = {
  color: 'yellow',
};

const robestyle = {
  color: 'lightblue',
};

const destructionstyle = {
  color: 'red',
};

const defensestyle = {
  color: 'orange',
};

const transportstyle = {
  color: 'yellow',
};

const summonstyle = {
  color: 'cyan',
};

const ritualstyle = {
  color: 'violet',
};

const grandritualstyle = {
  fontWeight: 'bold',
  color: '#bd54e0',
};

type GrandRitual = {
  remaining: number;
  next_area: string;
};

type Info = {
  objectives: Objective[];
  ritual: GrandRitual;
  can_change_objective: BooleanLike;
};

export const AntagInfoWizard = (props) => {
  const { data, act } = useBackend<Info>();
  const { ritual, objectives, can_change_objective } = data;

  return (
    <Window width={620} height={630} theme="wizard">
      <Window.Content>
        <Stack vertical fill>
          <Stack.Item grow>
            <Section scrollable fill>
              <Stack vertical>
                <Stack.Item textColor="red" fontSize="20px">
                  Вы - Космический Маг!
                </Stack.Item>
                <Stack.Item>
                  <ObjectivePrintout
                    objectives={objectives}
                    titleMessage="Федерация Космических Магов выдала вам следующие задачи"
                    objectiveFollowup={
                      <ReplaceObjectivesButton
                        can_change_objective={can_change_objective}
                        button_title={'Объявить личный квест'}
                        button_colour={'violet'}
                      />
                    }
                  />
                </Stack.Item>
                <Stack.Item>
                  <RitualPrintout ritual={ritual} />
                </Stack.Item>
              </Stack>
            </Section>
          </Stack.Item>
          <Stack.Item>
            <Section fill title="Книга заклинаний">
              <Stack vertical fill>
                <Stack.Item>
                  У вас есть привязанная к вам книга заклинаний. С её помощью
                  можно выбрать магический арсенал.
                  <br />
                  <span style={destructionstyle}>
                    На смертоносной странице находятся атакующие заклинания для
                    уничтожения врагов.
                  </span>
                  <br />
                  <span style={defensestyle}>
                    На защитной странице находятся защитные заклинания, чтобы
                    сохранить вам жизнь. Помните: вы могущественны, но всё ещё
                    человек.
                  </span>
                  <br />
                  <span style={transportstyle}>
                    На транспортной странице находятся заклинания мобильности,
                    важные для выживания и выполнения дел.
                  </span>
                  <br />
                  <span style={summonstyle}>
                    На странице призыва находятся призывающие и вспомогательные
                    заклинания, чтобы не сражаться в одиночку. Осторожно: не
                    каждый призванный будет на вашей стороне.
                  </span>
                  <br />
                  <span style={ritualstyle}>
                    На странице ритуалов находятся мощные глобальные эффекты,
                    которые заставят станцию бороться с самой собой. Учтите:
                    они либо дороги, либо нужны больше для стиля.
                  </span>
                </Stack.Item>
                <Stack.Item textColor="lightgreen">
                  (Если вы не уверены, что взять, или вы новичок Федерации,
                  откройте раздел &quot;Одобренные магами наборы&quot;. Там
                  есть комплекты, которые хорошо подходят начинающим магам.)
                </Stack.Item>
              </Stack>
            </Section>
          </Stack.Item>
          <Stack.Item>
            <Section title="Прочее снаряжение">
              <Stack>
                <Stack.Item>
                  <span style={teleportstyle}>Свиток телепортации:</span> 4
                  применения для телепортации куда угодно. Вернуться в логово
                  вы не сможете, так что убедитесь, что готовы к отправлению.
                  <br />
                  <span style={robestyle}>Мантия мага:</span> нужна для
                  произнесения большинства заклинаний. Книга заклинаний
                  подскажет, какие заклинания нельзя читать без одеяния.
                </Stack.Item>
              </Stack>
            </Section>
          </Stack.Item>
          <Stack.Item>
            <Section textAlign="center" textColor="red" fontSize="20px">
              Помните: не забудьте подготовить заклинания.
            </Section>
          </Stack.Item>
        </Stack>
      </Window.Content>
    </Window>
  );
};

const RitualPrintout = (props: { ritual: GrandRitual }) => {
  const { ritual } = props;
  if (!ritual.next_area) {
    return null;
  }
  return (
    <Box>
      Или завершите{' '}
      <span style={grandritualstyle}>Великий Ритуал </span>, активировав
      ритуальный круг в нескольких узлах силы.
      <br />
      Нужно завершить ритуал ещё
      <span style={grandritualstyle}> {ritual.remaining}</span> раз.
      <br />
      Следующее место ритуала:
      <span style={grandritualstyle}> {ritual.next_area}</span>.
    </Box>
  );
};
