import { sortBy } from 'es-toolkit';
import { map } from 'es-toolkit/compat';
import { Box, Button, Flex, Section, Table } from 'tgui-core/components';

import { useBackend } from '../backend';
import { Window } from '../layouts';

export const AtmosControlPanel = (props) => {
  const { act, data } = useBackend();
  const groups = sortBy(
    map(data.excited_groups, (group, i) => ({
      ...group,
      // Generate a unique id
      id: group.area + i,
    })),
    [(group) => group.id],
  );
  return (
    <Window title="Панель управления SSAir" width={900} height={500}>
      <Section m={1}>
        <Flex justify="space-between" align="baseline">
          <Flex.Item>
            <Button
              onClick={() => act('toggle-freeze')}
              color={data.frozen === 1 ? 'good' : 'bad'}
            >
              {data.frozen === 1 ? 'Заморозить подсистему' : 'Разморозить подсистему'}
            </Button>
          </Flex.Item>
          <Flex.Item>Пожары: {data.fire_count}</Flex.Item>
          <Flex.Item>Активные тайлы: {data.active_size}</Flex.Item>
          <Flex.Item>Возбужденные группы: {data.excited_size}</Flex.Item>
          <Flex.Item>Очаги: {data.hotspots_size}</Flex.Item>
          <Flex.Item>Сверхпроводники: {data.conducting_size}</Flex.Item>
          <Flex.Item>
            <Button.Checkbox
              checked={data.showing_user}
              onClick={() => act('toggle_user_display')}
            >
              Личный вид
            </Button.Checkbox>
          </Flex.Item>
          <Flex.Item>
            <Button.Checkbox
              checked={data.show_all}
              onClick={() => act('toggle_show_all')}
            >
              Показать все
            </Button.Checkbox>
          </Flex.Item>
        </Flex>
      </Section>
      <Box fillPositionedParent top="45px">
        <Window.Content scrollable>
          <Section>
            <Table>
              <Table.Row header>
                <Table.Cell>Название зоны</Table.Cell>
                <Table.Cell collapsing>Разбивка</Table.Cell>
                <Table.Cell collapsing>Разборка</Table.Cell>
                <Table.Cell collapsing>Тайлы</Table.Cell>
                <Table.Cell collapsing>
                  {data.display_max === 1 && 'Макс. доля'}
                </Table.Cell>
                <Table.Cell collapsing>Показ</Table.Cell>
              </Table.Row>
              {groups.map((group) => (
                <tr key={group.id}>
                  <td>
                    <Button
                      content={group.area}
                      onClick={() =>
                        act('move-to-target', {
                          spot: group.jump_to,
                        })
                      }
                    />
                  </td>
                  <td>{group.breakdown}</td>
                  <td>{group.dismantle}</td>
                  <td>{group.size}</td>
                  <td>{data.display_max === 1 && group.max_share}</td>
                  <td>
                    <Button.Checkbox
                      checked={group.should_show}
                      onClick={() =>
                        act('toggle_show_group', {
                          group: group.group,
                        })
                      }
                    />
                  </td>
                </tr>
              ))}
            </Table>
          </Section>
        </Window.Content>
      </Box>
    </Window>
  );
};
