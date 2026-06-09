import {
  Box,
  Collapsible,
  Divider,
  LabeledList,
  Section,
  Stack,
} from 'tgui-core/components';

import { useBackend } from '../backend';
import { Window } from '../layouts';
import type { Objective } from './common/Objectives';

type Data = {
  color: string;
  description: string;
  effects: string;
  name: string;
  objectives: Objective[];
};

const BLOB_COLOR = '#556b2f';

export const AntagInfoBlob = (props) => {
  return (
    <Window width={400} height={550}>
      <Window.Content>
        <Section fill scrollable>
          <Overview />
          <Divider />
          <Basics />
          <Structures />
          <Minions />
          <ObjectiveDisplay />
        </Section>
      </Window.Content>
    </Window>
  );
};

const Overview = (props) => {
  const { data } = useBackend<Data>();
  const { color, description, effects, name } = data;

  if (!name) {
    return (
      <Stack vertical>
        <Stack.Item bold fontSize="14px" textColor={BLOB_COLOR}>
          Вы ещё не раскрыли свою истинную форму!
        </Stack.Item>
        <Stack.Item>
          Нужно поддаться заражению. Найдите безопасное место и раскройтесь!
        </Stack.Item>
      </Stack>
    );
  }

  return (
    <Stack vertical>
      <Stack.Item bold fontSize="24px" textColor={BLOB_COLOR}>
        Вы - Блоб!
      </Stack.Item>
      <Stack.Item>Как сверхразум, вы можете управлять блобом.</Stack.Item>
      <Stack.Item>
        Реагент вашего блоба:{' '}
        <span
          style={{
            color,
          }}
        >
          {name}
        </span>
      </Stack.Item>
      <Stack.Item>
        Реагент{' '}
        <span
          style={{
            color,
          }}
        >
          {name}
        </span>{' '}
        {' '}
        {description}
      </Stack.Item>
      {effects && (
        <Stack.Item>
          Реагент{' '}
          <span
            style={{
              color,
            }}
          >
            {name}
          </span>{' '}
          {' '}
          {effects}
        </Stack.Item>
      )}
    </Stack>
  );
};

const Basics = (props) => {
  return (
    <Collapsible title="Основы">
      <LabeledList>
        <LabeledList.Item label="Атака">
          Вы можете расширяться: это атакует людей, повреждает объекты или
          размещает обычный блоб, если клетка свободна.
        </LabeledList.Item>
        <LabeledList.Item label="Размещение">
          Вы можете вручную поставить ядро блоба кнопкой размещения ядра в
          правом нижнем углу экрана.{' '}
          <br />
          <br />
          Если вы заражение блоба, можно поставить ядро прямо под собой,
          нажав кнопку раскрытия в левом верхнем углу экрана.
        </LabeledList.Item>
        <LabeledList.Item label="HUD">
          Кроме кнопок на HUD, есть несколько быстрых действий кликом для
          ускорения расширения и защиты.
        </LabeledList.Item>
        <LabeledList.Item label="Быстрые действия">
          Клик = расширить блоб <br />
          Средняя кнопка мыши = собрать споры <br />
          Ctrl + клик = создать защитный блоб <br />
          Alt + клик = удалить блоб <br />
        </LabeledList.Item>
        <LabeledList.Item label="Связь">
          Попытка говорить отправит сообщение всем остальным сверхразумам,
          позволяя координироваться с ними.
        </LabeledList.Item>
      </LabeledList>
    </Collapsible>
  );
};

const Minions = (props) => {
  return (
    <Collapsible title="Миньоны">
      <LabeledList>
        <LabeledList.Item label="Блоббернауты">
          Этих существ можно создавать на фабриках за ресурсы. Они живучие,
          сильные и достаточно умные. Фабрика, создавшая такого бойца, станет
          хрупкой и ненадолго перестанет производить споры.
        </LabeledList.Item>
        <LabeledList.Item label="Споры">
          Автоматически создаются фабриками. Они слабы, но их можно собрать
          для атаки врагов. Также они атакуют врагов рядом с фабрикой и
          пытаются зомбировать трупы.
        </LabeledList.Item>
      </LabeledList>
    </Collapsible>
  );
};

const Structures = (props) => {
  return (
    <Collapsible title="Структуры">
      <Box>
        Обычные блобы расширяют вашу зону контроля и могут улучшаться в
        специальные блобы с разными функциями. Помните: расширение в космос
        имеет 80% шанс провала!
      </Box>
      <br />
      <Box>Обычные блобы можно улучшать в следующие типы:</Box>
      <Divider />
      <LabeledList>
        <LabeledList.Item label="Крепкие блобы">
          Крепкие блобы дороги, но выдерживают больше урона. Кроме того, они
          огнеупорны и блокируют воздух, поэтому подходят для защиты от
          пожаров на станции.
        </LabeledList.Item>
        <LabeledList.Item label="Отражающие блобы">
          Улучшение крепкого блоба создаёт отражающий блоб, способный отражать
          большинство снарядов ценой дополнительной прочности крепкого блоба.
        </LabeledList.Item>
        <LabeledList.Item label="Ресурсные блобы">
          Производят для вас больше ресурсов. Стройте их как можно больше,
          чтобы поглотить станцию. Этот тип должен находиться рядом с узловыми
          блобами или вашим ядром.
        </LabeledList.Item>
        <LabeledList.Item label="Фабричные блобы">
          Создают споры блоба, которые атакуют ближайших врагов. Этот тип
          должен находиться рядом с узловыми блобами или вашим ядром.
        </LabeledList.Item>
        <LabeledList.Item label="Узловые блобы">
          Растут, как ядро. Как и ядро, они активируют ресурсные и фабричные
          блобы.
        </LabeledList.Item>
      </LabeledList>
    </Collapsible>
  );
};

const ObjectiveDisplay = (props) => {
  const { data } = useBackend<Data>();
  const { color, objectives } = data;

  return (
    <Collapsible title="Цели">
      <LabeledList>
        {objectives.map(({ explanation }, index) => (
          <LabeledList.Item
            color={color ?? 'white'}
            key={index}
            label={(index + 1).toString()}
          >
            {explanation}
          </LabeledList.Item>
        ))}
      </LabeledList>
    </Collapsible>
  );
};
