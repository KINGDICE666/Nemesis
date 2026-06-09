import { BlockQuote, LabeledList, Section, Stack } from 'tgui-core/components';

import { Window } from '../layouts';

const tipstyle = {
  color: 'white',
};

const noticestyle = {
  color: 'lightblue',
};

export const AntagInfoSunwalker = (props) => {
  return (
    <Window width={660} height={300}>
      <Window.Content backgroundColor="#0d0d0d">
        <Stack fill>
          <Stack.Item width="40%">
            <Section fill>
              <Stack vertical fill>
                <Stack.Item fontSize="25px">Вы - Солнцеход</Stack.Item>
                <Stack.Item>
                  <BlockQuote>
                    Вы - древний пустотник, попавший в сверхновую. Вы
                    изменены и полны ненависти.
                  </BlockQuote>
                  <BlockQuote>
                    Не будет ни уроков, ни просветления. Они не переживут это,
                    чтобы чему-то научиться.
                  </BlockQuote>
                </Stack.Item>
                <Stack.Divider />
              </Stack>
            </Section>
          </Stack.Item>
          <Stack.Item width="60%">
            <Section fill title="Способности">
              <LabeledList>
                <LabeledList.Item label="Космическое погружение">
                  Вы можете перемещаться под станцией из космоса. Используйте
                  это для охоты и выхода к изолированным участкам космоса.
                </LabeledList.Item>
                <LabeledList.Item label="Пылающий удар">
                  Ваши атаки наносят сильный ожоговый урон и поджигают жертв.
                </LabeledList.Item>
                <LabeledList.Item label="Пылающая физиология">
                  Сама ваша кожа нагревает воздух вокруг, а вакуум космоса
                  залечивает полученные раны. Вы свободно проходите сквозь
                  стекло, но замедляетесь при гравитации.
                </LabeledList.Item>
                <LabeledList.Item label="Звёздный рывок">
                  Рваните вперёд с взрывной пылающей скоростью, нанося урон и
                  поджигая окружение.
                </LabeledList.Item>
              </LabeledList>
            </Section>
          </Stack.Item>
        </Stack>
      </Window.Content>
    </Window>
  );
};
