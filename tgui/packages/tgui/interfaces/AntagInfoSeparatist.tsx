import { Icon, Section, Stack } from 'tgui-core/components';

import { useBackend } from '../backend';
import { Window } from '../layouts';
import { type Objective, ObjectivePrintout } from './common/Objectives';

type Info = {
  objectives: Objective[];
  nation: string;
  nationColor: string;
};

export const AntagInfoSeparatist = (props) => {
  const { data } = useBackend<Info>();
  const { nationColor } = data;
  return (
    <Window width={620} height={450}>
      <Window.Content backgroundColor={nationColor}>
        <Stack vertical fill>
          <Stack.Item grow>
            <IntroductionObjectives />
          </Stack.Item>
          <Stack.Item>
            <FrequentlyAskedQuestions />
          </Stack.Item>
        </Stack>
      </Window.Content>
    </Window>
  );
};

const IntroductionObjectives = (props) => {
  const { data } = useBackend<Info>();
  const { nation, objectives } = data;
  return (
    <Section fill>
      <Stack vertical>
        <Stack.Item textColor="red" fontSize="20px">
          Вы - сепаратист свободной {nation}!
        </Stack.Item>
        <Stack.Item grow>
          <ObjectivePrintout
            objectives={objectives}
            titleMessage={`Цели ${nation}`}
          />
        </Stack.Item>
      </Stack>
    </Section>
  );
};

const FrequentlyAskedQuestions = (props) => {
  const { data } = useBackend<Info>();
  const { nation } = data;
  return (
    <Section fill>
      <Stack vertical>
        <Stack.Item fontSize="18px" bold>
          <Icon name="info" color="label" /> Частые вопросы:
        </Stack.Item>
        <Stack.Item fontSize="16px">
          &quot;Кто вообще такой сепаратист?&quot;
        </Stack.Item>
        <Stack.Item>
          Сепаратисты - полуантагонисты, которыми заполняется каждый отдел в
          начале раунда. Они не получают права свободно ходить и убивать, их
          задача - защищать суверенитет своего отдела. Возможно, вы узнаете их
          по историческому режиму, откуда они появились: Nations!
        </Stack.Item>
        <Stack.Item fontSize="16px">
          &quot;Что мне делать?&quot;
        </Stack.Item>
        <Stack.Item>
          У каждого отдела (нации) есть цель. Она свободной формы, поэтому
          старайтесь следовать ей так же, как свободной цели абдукторов. По
          опыту, рано или поздно нации конфликтуют и скатываются в войну. Если
          оба отдела понимают, из-за чего начинается конфликт, это зелёный свет
          для атаки враждебных наций.
        </Stack.Item>
        <Stack.Item fontSize="16px">
          &quot;{nation} - лучшая нация?&quot;
        </Stack.Item>
        <Stack.Item>Да.</Stack.Item>
      </Stack>
    </Section>
  );
};
