import { Icon, Section, Stack } from 'tgui-core/components';
import type { BooleanLike } from 'tgui-core/react';

import { useBackend } from '../backend';
import { Window } from '../layouts';
import {
  type Objective,
  ObjectivePrintout,
  ReplaceObjectivesButton,
} from './common/Objectives';

const ninja_emphasis = {
  color: 'red',
};

type NinjaInfo = {
  objectives: Objective[];
  can_change_objective: BooleanLike;
};

export const AntagInfoNinja = (props) => {
  const { data } = useBackend<NinjaInfo>();
  const { objectives, can_change_objective } = data;
  return (
    <Window width={550} height={450} theme="hackerman">
      <Window.Content>
        <Icon
          size={30}
          name="spider"
          color="#003300"
          position="absolute"
          top="10%"
          left="10%"
        />
        <Section scrollable fill>
          <Stack vertical textColor="green">
            <Stack.Item textAlign="center" fontSize="20px">
              Я элитный наёмник Клана Паука.
              <br />
              <span style={ninja_emphasis}> КОСМИЧЕСКИЙ НИНДЗЯ</span>!
            </Stack.Item>
            <Stack.Item textAlign="center" italic>
              Внезапность - моё оружие. Тени - моя броня. Без них я ничто.
            </Stack.Item>
            <Stack.Item>
              <Section fill>
                Ваш продвинутый костюм ниндзя содержит множество мощных
                модулей.
                <br /> Его можно заряжать правым кликом по станционным ЛКП или
                другим источникам энергии, высасывая их заряд.
                <br />
                Правый клик по некоторым машинам или предметам при надетом
                костюме взломает их с разным эффектом. Экспериментируйте и
                узнайте, на что способны!
              </Section>
            </Stack.Item>
            <Stack.Item>
              <ObjectivePrintout
                objectives={objectives}
                objectiveFollowup={
                  <ReplaceObjectivesButton
                    can_change_objective={can_change_objective}
                    button_title={'Адаптировать параметры миссии'}
                    button_colour={'green'}
                  />
                }
              />
            </Stack.Item>
          </Stack>
        </Section>
      </Window.Content>
    </Window>
  );
};
