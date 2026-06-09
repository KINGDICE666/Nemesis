import { useState } from 'react';
import {
  Button,
  Dimmer,
  Dropdown,
  NoticeBox,
  Section,
  Stack,
} from 'tgui-core/components';
import type { BooleanLike } from 'tgui-core/react';

import { useBackend } from '../backend';
import { Window } from '../layouts';
import {
  type Objective,
  ObjectivePrintout,
  ReplaceObjectivesButton,
} from './common/Objectives';

const hivestyle = {
  fontWeight: 'bold',
  color: 'yellow',
};

const absorbstyle = {
  color: 'red',
  fontWeight: 'bold',
};

const revivestyle = {
  color: 'lightblue',
  fontWeight: 'bold',
};

const transformstyle = {
  color: 'orange',
  fontWeight: 'bold',
};

const storestyle = {
  color: 'lightgreen',
  fontWeight: 'bold',
};

const hivemindstyle = {
  color: 'violet',
  fontWeight: 'bold',
};

const fallenstyle = {
  color: 'black',
  fontWeight: 'bold',
};

type Memory = {
  name: string;
  story: string;
};

type Info = {
  true_name: string;
  hive_name: string;
  stolen_antag_info: string;
  memories: Memory[];
  objectives: Objective[];
  can_change_objective: BooleanLike;
  absorbed_dna: number;
};

export const AntagInfoChangeling = (props) => {
  return (
    <Window width={720} height={750}>
      <Window.Content
        style={{
          backgroundImage: 'none',
        }}
      >
        <Stack vertical fill>
          <Stack.Item maxHeight={16}>
            <IntroductionSection />
          </Stack.Item>
          <Stack.Item grow={4}>
            <AbilitiesSection />
          </Stack.Item>
          <BetrayalWarning />
          <Stack.Item grow={3}>
            <Stack fill>
              <Stack.Item grow>
                <MemoriesSection />
              </Stack.Item>
              <Stack.Item grow>
                <VictimPatternsSection />
              </Stack.Item>
            </Stack>
          </Stack.Item>
        </Stack>
      </Window.Content>
    </Window>
  );
};

const IntroductionSection = (props) => {
  const { act, data } = useBackend<Info>();
  const {
    true_name,
    hive_name,
    objectives,
    can_change_objective,
    absorbed_dna,
  } = data;
  return (
    <Section
      fill
      title="Вводная"
      style={{ overflowY: 'auto' }}
      buttons={
        <Button
          icon="dna"
          tooltipPosition="left"
          tooltip={`Поглощённая ДНК`}
          color="purple"
        >
          {absorbed_dna}
        </Button>
      }
    >
      <Stack vertical fill>
        <Stack.Item fontSize="25px">
          Вы - {true_name} из
          <span style={hivestyle}> {hive_name}</span>.
        </Stack.Item>
        <Stack.Item>
          <ObjectivePrintout
            objectives={objectives}
            objectiveFollowup={
              <ReplaceObjectivesButton
                can_change_objective={can_change_objective}
                button_title={'Эволюционировать новые директивы'}
                button_colour={'green'}
              />
            }
          />
        </Stack.Item>
      </Stack>
    </Section>
  );
};

const AbilitiesSection = () => {
  const { act, data } = useBackend<Info>();
  const { true_name } = data;
  return (
    <Section fill title="Способности">
      <Stack fill>
        <Stack.Item grow>
          <Stack fill vertical>
            <Stack.Item textColor="label" grow>
              Ваша способность
              <span style={absorbstyle}>&ensp;Поглотить ДНК</span> позволяет
              украсть ДНК и воспоминания жертвы. Способность
              <span style={absorbstyle}>&ensp;Жало извлечения ДНК</span> тоже
              крадёт ДНК жертвы и остаётся незаметной, но не даёт её
              воспоминаний или речевых шаблонов.
            </Stack.Item>
            <Stack.Divider />
            <Stack.Item textColor="label" grow>
              Ваша способность
              <span style={revivestyle}>&ensp;Оживляющий стазис</span>
              позволяет воскреснуть. Это значит, что остановить вас может
              только полное уничтожение тела! Разумеется, это шумно, так что не
              делайте этого перед теми, кого не собираетесь заставить замолчать.
            </Stack.Item>
          </Stack>
        </Stack.Item>
        <Stack.Divider />
        <Stack.Item grow>
          <Stack fill vertical>
            <Stack.Item textColor="label" grow>
              Ваша способность
              <span style={transformstyle}>&ensp;Трансформация</span> позволяет
              принять облик тех, чью ДНК вы собрали, смертельно или
              несмертельно. Она также имитирует (ЭТО НЕ НАСТОЯЩАЯ ОДЕЖДА)
              одежду цели во всех свободных слотах.
            </Stack.Item>
            <Stack.Divider />
            <Stack.Item textColor="label" grow>
              <span style={storestyle}>Клеточный эмпориум</span> позволяет
              покупать дополнительные способности сверх стартового набора. У
              вас есть 10 генетических очков на способности, а после поглощения
              тела можно переадаптироваться, вернув очки для другого набора.
            </Stack.Item>
          </Stack>
        </Stack.Item>
        <Stack.Divider />
        <Stack.Item grow>
          <Stack fill vertical>
            <Stack.Item textColor="label" grow>
              Все способности расходуют{' '}
              <span style={hivemindstyle}>химикаты</span>. Их количество видно
              на HUD слева. Можно навести курсор, чтобы увидеть максимальный
              запас химикатов. Этот максимум растёт при
              <span style={absorbstyle}>&ensp;поглощении</span> других
              генокрадов.
            </Stack.Item>
            <Stack.Divider />
            <Stack.Item textColor="label" grow>
              Все генокрады, независимо от происхождения, связаны{' '}
              <span style={hivemindstyle}>ульем разума</span>. Вы можете
              общаться с другими генокрадами под своим ментальным псевдонимом{' '}
              <span style={hivemindstyle}>{true_name}</span>, начиная сообщение
              с <span style={hivemindstyle}>:g</span>. Работайте вместе, и вы
              поднимете ужас станции на новый уровень.
            </Stack.Item>
          </Stack>
        </Stack.Item>
      </Stack>
    </Section>
  );
};

const BetrayalWarning = (props) => {
  return (
    <NoticeBox danger>
      Другие генокрады - сильные союзники, но некоторые могут предать вас.
      Генокрады значительно усиливаются, поглощая себе подобных, а поглощение
      другим генокрадом оставит вас как{' '}
      <span style={fallenstyle}>падшего генокрада</span>. Нет унижения сильнее.
    </NoticeBox>
  );
};

const MemoriesSection = (props) => {
  const { data } = useBackend<Info>();
  const { memories } = data;
  const [selectedMemory, setSelectedMemory] = useState(
    (!!memories && memories[0]) || null,
  );
  const memoryMap = {};
  for (const index in memories) {
    const memory = memories[index];
    memoryMap[memory.name] = memory;
  }

  return (
    <Section
      fill
      scrollable={!!memories && !!memories.length}
      title="Украденные воспоминания"
      buttons={
        <Button
          icon="info"
          tooltipPosition="left"
          tooltip={`
            Поглощение целей позволяет
            собирать их воспоминания. Они помогут
            выдавать себя за жертву!
          `}
        />
      }
    >
      {(!!memories && !memories.length && (
        <Dimmer fontSize="20px">Сначала поглотите жертву!</Dimmer>
      )) || (
        <Stack vertical>
          <Stack.Item>
            <Dropdown
              width="100%"
              selected={selectedMemory?.name}
              options={memories.map((memory) => {
                return memory.name;
              })}
              onSelected={(selected) => setSelectedMemory(memoryMap[selected])}
            />
          </Stack.Item>
          <Stack.Item>{!!selectedMemory && selectedMemory.story}</Stack.Item>
        </Stack>
      )}
    </Section>
  );
};

const VictimPatternsSection = (props) => {
  const { data } = useBackend<Info>();
  const { stolen_antag_info } = data;
  return (
    <Section
      fill
      scrollable={!!stolen_antag_info}
      title="Дополнительная украденная информация"
    >
      {(!!stolen_antag_info && stolen_antag_info) || (
        <Dimmer fontSize="20px">Сначала поглотите жертву!</Dimmer>
      )}
    </Section>
  );
};
