import { Box, Icon, Section, Stack } from 'tgui-core/components';

import { useBackend } from '../backend';
import { Window } from '../layouts';
import { type Objective, ObjectivePrintout } from './common/Objectives';

type Data = {
  objectives: Objective[];
};

export const AntagInfoBrainwashed = (porps) => {
  const { data } = useBackend<Data>();

  return (
    <Window width={400} height={400} theme="abductor">
      <Window.Content backgroundColor="#722e7d">
        <Icon
          size={16}
          name="flushed"
          color="#3f1945"
          position="absolute"
          top="42%"
          left="26%"
        />
        <Section fill>
          <Stack fill vertical g={0} textAlign="center">
            <Stack.Item fontFamily="Wingdings">
              Эй, нет! Хватит это переводить!
            </Stack.Item>
            <Stack.Item fontSize="20px">Ваш разум кружится...</Stack.Item>
            <Stack.Item fontSize="20px">
              Он сосредотачивается на единственной цели...
            </Stack.Item>
            <Stack.Item mt={3.5} grow>
              <ObjectivePrintout
                fill
                objectives={data.objectives}
                objectiveFollowup={
                  <Box bold textColor="red">
                    Эта директива должна быть исполнена.
                  </Box>
                }
              />
            </Stack.Item>
            <Stack.Item mb={0.5} fontSize="20px" textColor="#61e4b9">
              Следуйте директивам любой ценой!
            </Stack.Item>
            <Stack.Item fontFamily="Wingdings">
              Вы испортили мой крутой эффект шрифта.
            </Stack.Item>
          </Stack>
        </Section>
      </Window.Content>
    </Window>
  );
};
