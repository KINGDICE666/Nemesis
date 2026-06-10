import {
  Button,
  Collapsible,
  NoticeBox,
  Section,
  Table,
} from 'tgui-core/components';
import type { BooleanLike } from 'tgui-core/react';

import { useBackend } from '../backend';
import { Window } from '../layouts';

type Data = {
  server_connected: BooleanLike;
  servers: ServerData[];
  consoles: ConsoleData[];
  logs: LogData[];
};

type ServerData = {
  server_name: string;
  server_details: string;
  server_disabled: string;
  server_ref: string;
};

type ConsoleData = {
  console_name: string;
  console_location: string;
  console_locked: string;
  console_ref: string;
};

type LogData = {
  node_name: string;
  node_cost: string;
  node_researcher: string;
  node_research_location: string;
};

export const ServerControl = (props) => {
  const { act, data } = useBackend<Data>();
  const { server_connected, servers, consoles, logs } = data;
  if (!server_connected) {
    return (
      <Window width={575} height={450}>
        <Window.Content>
          <NoticeBox textAlign="center" danger>
            Нет подключения к серверу. Синхронизируйте его мультитулом.
          </NoticeBox>
        </Window.Content>
      </Window>
    );
  }
  return (
    <Window width={575} height={400}>
      <Window.Content scrollable>
        {!servers ? (
          <NoticeBox mt={2} info>
            Серверы не найдены.
          </NoticeBox>
        ) : (
          <Section>
            <Table textAlign="center">
              <Table.Row header>
                <Table.Cell>Исследовательские серверы</Table.Cell>
              </Table.Row>
              {servers.map((server) => (
                <>
                  <Table.Row
                    header
                    key={server.server_ref}
                    className="candystripe"
                  />
                  <Table.Cell> {server.server_name}</Table.Cell>
                  <Button
                    mt={1}
                    tooltip={server.server_details}
                    color={server.server_disabled ? 'bad' : 'good'}
                    content={server.server_disabled ? 'Отключен' : 'Включен'}
                    fluid
                    textAlign="center"
                    onClick={() =>
                      act('lockdown_server', {
                        selected_server: server.server_ref,
                      })
                    }
                  />
                </>
              ))}
            </Table>
          </Section>
        )}

        {!consoles ? (
          <NoticeBox mt={2} info>
            Консоли не найдены.
          </NoticeBox>
        ) : (
          <Section align="right">
            <Table textAlign="center">
              <Table.Row header>
                <Table.Cell>Исследовательские консоли</Table.Cell>
              </Table.Row>
              {consoles.map((console) => (
                <>
                  <Table.Row
                    header
                    key={console.console_ref}
                    className="candystripe"
                  />
                  <Table.Cell>
                    {' '}
                    {console.console_name} - Местоположение:{' '}
                    {console.console_location}{' '}
                  </Table.Cell>
                  <Button
                    mt={1}
                    color={console.console_locked ? 'bad' : 'good'}
                    content={console.console_locked ? 'ЗАБЛОКИРОВАНА' : 'РАЗБЛОКИРОВАНА'}
                    fluid
                    textAlign="center"
                    onClick={() =>
                      act('lock_console', {
                        selected_console: console.console_ref,
                      })
                    }
                  />
                </>
              ))}
            </Table>
          </Section>
        )}

        <Collapsible title="История исследований">
          {!logs.length ? (
            <NoticeBox mt={2} info>
              История не найдена.
            </NoticeBox>
          ) : (
            <Section>
              <Table>
                <Table.Row header>
                  <Table.Cell>Исследование</Table.Cell>
                  <Table.Cell>Стоимость</Table.Cell>
                  <Table.Cell>Исследователь</Table.Cell>
                  <Table.Cell>Расположение консоли</Table.Cell>
                </Table.Row>
                {logs.map((server_log) => (
                  <Table.Row
                    mt={1}
                    key={server_log.node_name}
                    className="candystripe"
                  >
                    <Table.Cell>{server_log.node_name}</Table.Cell>
                    <Table.Cell>{server_log.node_cost}</Table.Cell>
                    <Table.Cell>{server_log.node_researcher}</Table.Cell>
                    <Table.Cell>{server_log.node_research_location}</Table.Cell>
                  </Table.Row>
                ))}
              </Table>
            </Section>
          )}
        </Collapsible>
      </Window.Content>
    </Window>
  );
};
