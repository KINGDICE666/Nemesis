import { Section, Stack } from 'tgui-core/components';

import { useBackend } from '../backend';
import { Window } from '../layouts';
import type { Objective } from './common/Objectives';

type Data = {
  antag_name: string;
  objectives: Objective[];
};

const textStyles = {
  variable: {
    color: 'white',
  },
  danger: {
    color: 'red',
  },
} as const;

const GLITCH_NAMES: Record<string, string> = {
  'Cyber Police': 'Киберполиция',
  'Cyber Tac': 'Кибертактик',
  'NetGuardian Prime': 'НетСтраж-Прайм',
};

function localizeGlitchName(name: string): string {
  return GLITCH_NAMES[name] || name;
}

export const AntagInfoGlitch = (props) => {
  const { data } = useBackend<Data>();
  const { antag_name, objectives = [] } = data;

  return (
    <Window width={350} height={450} theme="ntos_terminal">
      <Window.Content>
        <Section scrollable fill>
          <Stack fill vertical>
            <Stack.Item>FN TERMINATE_INTRUDERS (REF)</Stack.Item>
            <Stack.Divider />
            <Stack.Item bold fontSize="16px">
              <span style={textStyles.variable}>
                Initialize({localizeGlitchName(antag_name)})
              </span>
            </Stack.Item>
            <Stack.Item mb={1}>
              <span style={textStyles.danger}>Битраннинг</span> - преступление.
              Ваша миссия: <span style={textStyles.variable}>устранить</span>{' '}
              органических нарушителей, чтобы сохранить целостность системы.
            </Stack.Item>
            <SpecificInfo />

            <Stack.Divider />
            <Stack.Item>
              <span style={{ opacity: 0.6 }}>
                &#47;&#47; {objectives[0]?.explanation}
              </span>
            </Stack.Item>
            <Stack.Item>
              const <span style={textStyles.variable}>TARGETS</span> ={' '}
            </Stack.Item>
            <Stack.Item>
              <span style={textStyles.variable}>system.</span>
              <span style={textStyles.danger}>INTRUDERS</span>
            </Stack.Item>
            <Stack.Item>
              while <span style={textStyles.variable}>TARGETS</span>.LIFE !={' '}
              <span style={textStyles.variable}>stat.</span>DEAD
            </Stack.Item>
            <Stack.Item>
              <span style={textStyles.variable}>action.</span>
              <span style={textStyles.danger}>KILL()</span>
            </Stack.Item>
            <Stack.Item>terminate_intruders([0x70cf4020])</Stack.Item>
          </Stack>
        </Section>
      </Window.Content>
    </Window>
  );
};

const SpecificInfo = (props) => {
  const { data } = useBackend<Data>();
  const { antag_name } = data;

  switch (antag_name) {
    case 'Cyber Police':
      return (
        <>
          <Stack.Item mb={1}>
            Для выполнения задачи ваша программа загружена передовыми навыками{' '}
            <span style={textStyles.variable}>боевых искусств</span>.
          </Stack.Item>
          <Stack.Item grow>
            Дальнобойное оружие <span style={textStyles.danger}>запрещено</span>.
            Баллистическая защита не приветствуется. Стиль превыше всего.
          </Stack.Item>
        </>
      );
    case 'Cyber Tac':
      return (
        <>
          <Stack.Item mb={1}>
            Вы - продвинутый боевой юнит. Вы оснащены{' '}
            <span style={textStyles.variable}>летальным вооружением</span>.
          </Stack.Item>
          <Stack.Item grow>
            <span style={textStyles.danger}>Уничтожить</span> органическую жизнь
            любой ценой.
          </Stack.Item>
        </>
      );
    case 'NetGuardian Prime':
      return (
        <Stack.Item grow>
          <span style={{ ...textStyles.danger, fontSize: '16px' }}>
            ОРГАНИЧЕСКАЯ ЖИЗНЬ ДОЛЖНА БЫТЬ УНИЧТОЖЕНА.
          </span>
        </Stack.Item>
      );
    default:
      return null;
  }
};
