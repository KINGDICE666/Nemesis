import { BlockQuote, Button, Section, Stack } from 'tgui-core/components';
import type { BooleanLike } from 'tgui-core/react';

import { useBackend } from '../backend';
import { Window } from '../layouts';
import { type Objective, ObjectivePrintout } from './common/Objectives';

const allystyle = {
  fontWeight: 'bold',
  color: 'yellow',
};

const badstyle = {
  color: 'red',
  fontWeight: 'bold',
};

const goalstyle = {
  color: 'lightblue',
  fontWeight: 'bold',
};

type Info = {
  has_codewords: BooleanLike;
  phrases: string;
  responses: string;
  theme: string;
  allies: string;
  goal: string;
  intro: string;
  code: string;
  failsafe_code: string;
  has_uplink: BooleanLike;
  uplink_intro: string;
  uplink_unlock_info: string;
  given_uplink: BooleanLike;
  objectives: Objective[];
};

const IntroductionSection = (props) => {
  const { act, data } = useBackend<Info>();
  const { intro, objectives } = data;
  return (
    <Section fill title="Вводная" scrollable>
      <Stack vertical fill>
        <Stack.Item fontSize="25px">{intro}</Stack.Item>
        <Stack.Item grow>
          <ObjectivePrintout objectives={objectives} />
        </Stack.Item>
      </Stack>
    </Section>
  );
};

const EmployerSection = (props) => {
  const { data } = useBackend<Info>();
  const { allies, goal } = data;
  return (
    <Section
      fill
      title="Работодатель"
      scrollable
      buttons={
        <Button
          icon="hammer"
          tooltip={`
            Это игровая подсказка для предателей, которым скучно.
            Следовать ей не обязательно, но она может дать идеи
            на раунд.`}
          tooltipPosition="bottom-start"
        >
          Политика
        </Button>
      }
    >
      <Stack vertical fill>
        <Stack.Item grow>
          <Stack vertical>
            <Stack.Item>
              <span style={allystyle}>
                Ваши связи:
                <br />
              </span>
              <BlockQuote>{allies}</BlockQuote>
            </Stack.Item>
            <Stack.Divider />
            <Stack.Item mb={1}>
              <span style={goalstyle}>
                Мысли работодателя:
                <br />
              </span>
              <BlockQuote>{goal}</BlockQuote>
            </Stack.Item>
          </Stack>
        </Stack.Item>
      </Stack>
    </Section>
  );
};

const UplinkSection = (props) => {
  const { data } = useBackend<Info>();
  const { has_uplink, uplink_intro, uplink_unlock_info, code, failsafe_code } =
    data;
  return (
    <Section title="Аплинк" mb={!has_uplink && -1}>
      <Stack fill>
        {
          <>
            <Stack.Item bold>
              {uplink_intro}
              <br />
              {code && <span style={goalstyle}>Код: {code}</span>}
              <br />
              {failsafe_code && (
                <span style={badstyle}>Аварийный код: {failsafe_code}</span>
              )}
            </Stack.Item>
            <Stack.Divider />
            <Stack.Item align="center">
              <BlockQuote>{uplink_unlock_info}</BlockQuote>
            </Stack.Item>
          </>
        }
      </Stack>
      <br />
      {
        <Section>
          {' '}
          <br />
          <br />
        </Section>
      }
    </Section>
  );
};

const CodewordsSection = (props) => {
  const { data } = useBackend<Info>();
  const { has_codewords, phrases, responses } = data;
  return (
    <Section title="Кодовые слова" mb={!has_codewords && -1}>
      <Stack fill>
        {(!has_codewords && (
          <BlockQuote>
            Вам не выдали кодовые слова. Придётся искать потенциальных
            союзников другими способами. Действуйте осторожно: каждый может
            оказаться врагом.
          </BlockQuote>
        )) || (
          <>
            <Stack.Item grow basis={0}>
              <BlockQuote>
                Работодатель выдал вам следующие кодовые слова для
                распознавания других агентов. Используйте их в обычном
                разговоре, чтобы найти своих. Действуйте осторожно: каждый
                может оказаться врагом.
                <span style={badstyle}>
                  &ensp;Вы запомнили кодовые слова и сможете распознать их на
                  слух.
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
};

export const AntagInfoTraitor = (props) => {
  const { data } = useBackend<Info>();
  const { theme, given_uplink } = data;
  return (
    <Window width={620} height={580} theme={theme}>
      <Window.Content>
        <Stack vertical fill>
          <Stack.Item grow>
            <Stack fill>
              <Stack.Item width="70%">
                <IntroductionSection />
              </Stack.Item>
              <Stack.Item width="30%">
                <EmployerSection />
              </Stack.Item>
            </Stack>
          </Stack.Item>
          {!!given_uplink && (
            <Stack.Item>
              <UplinkSection />
            </Stack.Item>
          )}
          <Stack.Item>
            <CodewordsSection />
          </Stack.Item>
        </Stack>
      </Window.Content>
    </Window>
  );
};
