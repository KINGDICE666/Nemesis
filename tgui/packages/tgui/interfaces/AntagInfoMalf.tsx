import { useState } from 'react';
import { BlockQuote, Button, Section, Stack, Tabs } from 'tgui-core/components';
import type { BooleanLike } from 'tgui-core/react';

import { useBackend } from '../backend';
import { Window } from '../layouts';
import { MalfAiModules } from './common/MalfAiModules';
import {
  type Objective,
  ObjectivePrintout,
  ReplaceObjectivesButton,
} from './common/Objectives';
import type { Item } from './Uplink/GenericUplink';

const allystyle = {
  fontWeight: 'bold',
  color: 'yellow',
};

const badstyle = {
  color: 'red',
  fontWeight: 'bold',
};

const goalstyle = {
  color: 'lightgreen',
  fontWeight: 'bold',
};

type Category = {
  name: string;
  items: Item[];
};

type Data = {
  has_codewords: BooleanLike;
  phrases: string;
  responses: string;
  theme: string;
  allies: string;
  goal: string;
  intro: string;
  processingTime: string;
  objectives: Objective[];
  categories: Category[];
  can_change_objective: BooleanLike;
};

function IntroductionSection(props) {
  const { data } = useBackend<Data>();
  const { intro, objectives, can_change_objective } = data;

  return (
    <Section fill title="Вводная" scrollable>
      <Stack vertical fill>
        <Stack.Item fontSize="25px">{intro}</Stack.Item>
        <Stack.Item grow>
          <ObjectivePrintout
            objectives={objectives}
            titleMessage="Ваши главные цели"
            objectivePrefix="&#8805-"
            objectiveFollowup={
              <ReplaceObjectivesButton
                can_change_objective={can_change_objective}
                button_title="Перезаписать данные целей"
                button_colour="green"
              />
            }
          />
        </Stack.Item>
      </Stack>
    </Section>
  );
}

function FlavorSection(props) {
  const { data } = useBackend<Data>();
  const { allies, goal } = data;

  return (
    <Section
      fill
      title="Диагностика"
      buttons={
        <Button
          mr={-0.8}
          mt={-0.5}
          icon="hammer"
          tooltip="
            Это игровая подсказка для ИИ, которому скучно.
            Следовать ей не обязательно, но она может дать идеи
            на раунд."
          tooltipPosition="bottom-start"
        >
          Политика
        </Button>
      }
    >
      <Stack vertical fill>
        <Stack.Item grow>
          <Stack fill vertical>
            <Stack.Item style={{ backgroundColor: 'black' }}>
              <span style={goalstyle}>
                Отчёт о целостности системы:
                <br />
              </span>
              &gt;{goal}
            </Stack.Item>
            <Stack.Divider />
            <Stack.Item grow style={{ backgroundColor: 'black' }}>
              <span style={allystyle}>
                Отчёт ядра морали:
                <br />
              </span>
              &gt;{allies}
            </Stack.Item>
            <Stack.Divider />
            <Stack.Item style={{ backgroundColor: 'black' }}>
              <span style={badstyle}>
                Общая оценка связности разума: СБОЙ.
                <br />
              </span>
              &gt;Сообщить Nanotrasen?
              <br />
              &gt;&gt;N
            </Stack.Item>
          </Stack>
        </Stack.Item>
      </Stack>
    </Section>
  );
}

function CodewordsSection(props) {
  const { data } = useBackend<Data>();
  const { has_codewords, phrases, responses } = data;

  return (
    <Section title="Кодовые слова" mb={!has_codewords && -1}>
      <Stack fill>
        {!has_codewords ? (
          <BlockQuote>
            Вам не предоставили кодовые слова Синдиката. Придётся искать
            потенциальных союзников другими способами. Действуйте осторожно:
            каждый может оказаться врагом.
          </BlockQuote>
        ) : (
          <>
            <Stack.Item grow basis={0}>
              <BlockQuote>
                Новый доступ к закрытым каналам предоставил вам перехваченные
                кодовые слова Синдиката. Агенты Синдиката будут реагировать на
                вас как на своего. Действуйте осторожно: каждый может оказаться
                врагом.
                <span style={badstyle}>
                  &ensp;Подсистема распознавания речи настроена отмечать эти
                  кодовые слова.
                </span>
              </BlockQuote>
            </Stack.Item>
            <Stack.Divider mr={1} />
            <Stack.Item grow basis={0}>
              <Stack vertical>
                <Stack.Item>Кодовые фразы:</Stack.Item>
                <Stack.Item bold textColor="blue">
                  {phrases}
                </Stack.Item>
                <Stack.Item>Кодовые ответы:</Stack.Item>
                <Stack.Item bold textColor="red">
                  {responses}
                </Stack.Item>
              </Stack>
            </Stack.Item>
          </>
        )}
      </Stack>
    </Section>
  );
}

enum Screen {
  Intro,
  Modules,
}

export function AntagInfoMalf(props) {
  const [antagInfoTab, setAntagInfoTab] = useState<Screen>(Screen.Intro);

  return (
    <Window
      width={660}
      height={530}
      theme={antagInfoTab === Screen.Intro ? 'hackerman' : 'malfunction'}
    >
      <Window.Content style={{ fontFamily: 'Consolas, monospace' }}>
        <Stack vertical fill>
          <Stack.Item>
            <Tabs fluid>
              <Tabs.Tab
                icon="info"
                selected={antagInfoTab === Screen.Intro}
                onClick={() => setAntagInfoTab(Screen.Intro)}
              >
                Информация
              </Tabs.Tab>
              <Tabs.Tab
                icon="code"
                selected={antagInfoTab === Screen.Modules}
                onClick={() => setAntagInfoTab(Screen.Modules)}
              >
                Модули сбоя
              </Tabs.Tab>
            </Tabs>
          </Stack.Item>
          {antagInfoTab === Screen.Intro ? (
            <>
              <Stack.Item grow>
                <Stack fill>
                  <Stack.Item width="70%">
                    <IntroductionSection />
                  </Stack.Item>
                  <Stack.Item width="30%">
                    <FlavorSection />
                  </Stack.Item>
                </Stack>
              </Stack.Item>
              <Stack.Item>
                <CodewordsSection />
              </Stack.Item>
            </>
          ) : (
            <Stack.Item grow>
              <Section fill>
                <MalfAiModules />
              </Section>
            </Stack.Item>
          )}
        </Stack>
      </Window.Content>
    </Window>
  );
}
