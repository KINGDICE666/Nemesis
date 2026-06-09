import { BlockQuote, Stack } from 'tgui-core/components';

import { Window } from '../layouts';

const goodstyle = {
  color: 'lightgreen',
};

const badstyle = {
  color: 'red',
};

const noticestyle = {
  color: 'lightblue',
};

export const AntagInfoMorph = (props) => {
  return (
    <Window width={620} height={170} theme="abductor">
      <Window.Content>
        <Stack vertical fill>
          <Stack.Item fontSize="25px">Вы - морф...</Stack.Item>
          <Stack.Item>
            <BlockQuote>
              ...меняющая форму аномалия, способная съесть почти всё. Вы
              можете принять форму любого видимого объекта,{' '}
              <span style={noticestyle}>
                применив к нему способность &quot;Принять форму&quot;. Shift-клик
                по нужному объекту тоже сработает.
              </span>{' '}
              <span style={badstyle}>
                &ensp;Этот процесс насторожит всех наблюдателей поблизости.
              </span>{' '}
              В принятой форме вы двигаетесь быстрее, но не можете атаковать
              существ или что-либо есть. Кроме того,
              <span style={badstyle}>
                &ensp;любой в пределах трёх клеток заметит странную
                неправильность, если осмотрит вас.
              </span>{' '}
              Вы можете атаковать любой предмет или мёртвое существо, чтобы
              поглотить его -
              <span style={goodstyle}>
                &ensp;трупы восстановят ваше здоровье.
              </span>{' '}
              Наконец, в принятой форме можно вернуться к исходному облику,{' '}
              <span style={noticestyle}>
                применив &quot;Принять форму&quot; к себе. Также можно
                shift-кликнуть по себе.
              </span>{' '}
            </BlockQuote>
          </Stack.Item>
        </Stack>
      </Window.Content>
    </Window>
  );
};
