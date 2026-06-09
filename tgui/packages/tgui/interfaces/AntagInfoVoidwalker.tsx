import { BlockQuote, LabeledList, Section, Stack } from 'tgui-core/components';

import { Window } from '../layouts';

const tipstyle = {
  color: 'white',
};

const noticestyle = {
  color: 'lightblue',
};

export const AntagInfoVoidwalker = (props) => {
  return (
    <Window width={660} height={660}>
      <Window.Content backgroundColor="#0d0d0d">
        <Stack fill>
          <Stack.Item width="50%">
            <Section fill>
              <Stack vertical fill>
                <Stack.Item fontSize="25px">Вы - Пустотник</Stack.Item>
                <Stack.Item>
                  <BlockQuote>
                    Вы - существо из пустоты между звёздами. Вас привлекли
                    радиосигналы, передаваемые этой станцией.
                  </BlockQuote>
                </Stack.Item>
                <Stack.Divider />
                <Stack.Item textColor="label">
                  <span style={tipstyle}>Выживайте:&ensp;</span>
                  У вас непревзойдённая свобода. Оставайтесь в космосе, и никто
                  не сможет вас остановить. Вы можете проходить сквозь окна,
                  держитесь рядом с ними, чтобы всегда иметь путь отхода.
                  <br />
                  <br />
                  <span style={tipstyle}>Охотьтесь:&ensp;</span>
                  Выбирайте нечестные схватки. Ищите невнимательные цели и
                  бейте, когда они не ждут.
                  <br />
                  <br />
                  <span style={tipstyle}>Похищайте:&ensp;</span>
                  Ваша способность Unsettle оглушает и истощает цели. Вырубите
                  их истощающим ударом, утащите в космос или в туманность и
                  просветите.
                  <br />
                  <br />
                  <span style={tipstyle}>Пожинайте:&ensp;</span>
                  Наши ученики регулярно исторгают нашу сущность. Мы можем
                  использовать её, чтобы попасть туда, куда иначе не смогли бы,
                  но поглощаем её обратно при уходе. (Вы можете нырять в
                  космическую рвоту.)
                </Stack.Item>
              </Stack>
            </Section>
          </Stack.Item>
          <Stack.Item width="50%">
            <Section fill title="Способности">
              <LabeledList>
                <LabeledList.Item label="Космическое погружение">
                  Вы можете перемещаться под станцией из космоса. Используйте
                  это для охоты и выхода к изолированным участкам космоса.
                </LabeledList.Item>
                <LabeledList.Item label="Истощающий удар">
                  Вы вырываете дыхание прямо из лёгких жертвы и быстро валите
                  даже сильных противников. Если они сопротивляются, правый клик
                  позволяет нанести прямой урон. В остальном ваши руки грубы и
                  годятся в основном для хватания.
                </LabeledList.Item>
                <LabeledList.Item label="Космическая физиология">
                  Природная маскировка делает вас невидимым в космосе и
                  залечивает полученные раны. Вы свободно проходите сквозь
                  стекло, но замедляетесь при гравитации.
                </LabeledList.Item>
                <LabeledList.Item label="Unsettle">
                  Выберите жертву, оставаясь лишь частично в её поле зрения,
                  чтобы оглушить и ослабить её, но при этом выдать своё
                  присутствие.
                </LabeledList.Item>
                <LabeledList.Item label="Космический рывок">
                  Небольшая дальность и слабый урон делают его плохой атакой,
                  зато он отлично подходит для быстрого отхода и смены позиции.
                </LabeledList.Item>
                <LabeledList.Item label="Расширение">
                  С каждым преподанным уроком мы становимся сильнее. Мы можем
                  превращать стены в стекло, чтобы добираться ещё дальше.
                </LabeledList.Item>
              </LabeledList>
            </Section>
          </Stack.Item>
        </Stack>
      </Window.Content>
    </Window>
  );
};
