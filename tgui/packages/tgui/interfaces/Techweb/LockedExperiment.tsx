import { Box, Button, Flex, Icon } from 'tgui-core/components';

export function LockedExperiment(props) {
  return (
    <Box m={1} className="ExperimentConfigure__ExperimentPanel">
      <Button
        fluid
        backgroundColor="#40628a"
        className="ExperimentConfigure__ExperimentName"
        disabled
      >
        <Flex align="center" justify="space-between">
          <Flex.Item color="rgba(0, 0, 0, 0.6)">
            <Icon name="lock" />
            Неоткрытый эксперимент
          </Flex.Item>
          <Flex.Item color="rgba(0, 0, 0, 0.5)">???</Flex.Item>
        </Flex>
      </Button>
      <Box className="ExperimentConfigure__ExperimentContent">
        Этот эксперимент еще не открыт. Продолжайте исследовать узлы дерева,
        чтобы раскрыть его содержимое.
      </Box>
    </Box>
  );
}
