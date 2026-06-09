import { BlockQuote, LabeledList, Section, Stack } from 'tgui-core/components';

import { Window } from '../layouts';

const tipstyle = {
  color: 'white',
};

const noticestyle = {
  color: 'lightblue',
};

export const AntagInfoNightmare = (props) => {
  return (
    <Window width={620} height={380}>
      <Window.Content backgroundColor="#0d0d0d">
        <Stack fill>
          <Stack.Item width="46.2%">
            <Section fill>
              <Stack vertical fill>
                <Stack.Item fontSize="25px">Вы - Кошмар.</Stack.Item>
                <Stack.Item>
                  <BlockQuote>
                    Вы - существо из-за пределов звёзд, обладающее невероятной
                    силой во тьме и почти непобедимое в ней. К несчастью, на
                    свету вы увядаете и сгораете. Используйте свой
                    <span style={noticestyle}>&ensp;пожиратель света</span>,
                    чтобы погрузить станцию во мрак и облегчить охоту.
                  </BlockQuote>
                </Stack.Item>
                <Stack.Divider />
                <Stack.Item textColor="label">
                  <span style={tipstyle}>Совет #1:&ensp;</span>
                  Чаще перемещайтесь. После обнаружения станция начнёт охоту,
                  поэтому не задерживайтесь в одном районе.
                  <br />
                  <span style={tipstyle}>Совет #2:&ensp;</span>
                  Выбирайте нечестные схватки. В дуэлях вы невероятно сильны,
                  пользуйтесь этим. Чем больше вы дерётесь, тем труднее
                  сохранять темноту.
                  <br />
                  <span style={tipstyle}>Совет #3:&ensp;</span>
                  По возможности полностью уничтожайте ЛКП. Вместо ламп,
                  которые легко починить, охотьтесь на ЛКП, их сложнее
                  восстановить.
                </Stack.Item>
              </Stack>
            </Section>
          </Stack.Item>
          <Stack.Item width="53%">
            <Section fill title="Способности">
              <LabeledList>
                <LabeledList.Item label="Танец теней">
                  В тени вы невосприимчивы ко всем дальнобойным атакам и быстро
                  восстанавливаете здоровье.
                </LabeledList.Item>
                <LabeledList.Item label="Ходьба в тенях">
                  В темноте вы можете свободно и без ограничений перемещаться.
                  Свет вытащит вас из этого состояния.
                </LabeledList.Item>
                <LabeledList.Item label="Сердце тьмы">
                  Ваше сердце зовёт тени. Если вы умрёте во тьме и вас оставят
                  в покое, со временем вы воскреснете.
                </LabeledList.Item>
                <LabeledList.Item label="Пожиратель света">
                  Ваш искажённый отросток. Он пожирает свет всего, к чему
                  прикасается, будь то жертва или объект. После 7 секунд в
                  рывке удар по врагу оглушит его или нанесёт дополнительный
                  урон.
                </LabeledList.Item>
              </LabeledList>
            </Section>
          </Stack.Item>
        </Stack>
      </Window.Content>
    </Window>
  );
};
