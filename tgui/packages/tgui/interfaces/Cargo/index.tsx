import { Button, Section, Stack, Tabs } from 'tgui-core/components';

import { useBackend, useSharedState } from '../../backend';
import { Window } from '../../layouts';
import { CargoCartButtons } from './CargoButtons';
import { CargoCart } from './CargoCart';
import { CargoCatalog } from './CargoCatalog';
import { CargoHelp } from './CargoHelp';
import { CargoRequests } from './CargoRequests';
import { CargoStatus } from './CargoStatus';
import type { CargoData } from './types';

enum TAB {
  Catalog = 'Каталог',
  Requests = 'Активные заявки',
  Cart = 'Корзина',
  Help = 'Помощь',
}

export function Cargo(props) {
  return (
    <Window width={800} height={750}>
      <Window.Content>
        <CargoContent />
      </Window.Content>
    </Window>
  );
}

export function CargoContent(props) {
  const { act, data } = useBackend<CargoData>();
  const { cart = [], requests = [], requestonly } = data;
  const [tab, setTab] = useSharedState('cargotab', TAB.Catalog);

  let amount = 0;
  for (let i = 0; i < cart.length; i++) {
    amount += cart[i].amount;
  }

  return (
    <Stack fill vertical>
      <Stack.Item>
        <CargoStatus />
      </Stack.Item>
      <Stack.Item>
        <Section
          title={tab || ''}
          buttons={
            <>
              {tab === TAB.Requests && !requestonly && (
                <Button
                  icon="times"
                  color="transparent"
                  onClick={() => act('denyall')}
                >
                  Очистить
                </Button>
              )}
              {(tab === TAB.Catalog || tab === TAB.Cart) && (
                <CargoCartButtons />
              )}
            </>
          }
        >
          <Tabs fluid m={-1}>
            <Tabs.Tab
              icon="list"
              selected={tab === TAB.Catalog}
              onClick={() => setTab(TAB.Catalog)}
            >
              Каталог
            </Tabs.Tab>
            <Tabs.Tab
              icon="envelope"
              textColor={
                tab !== TAB.Requests && requests.length > 0 && 'yellow'
              }
              selected={tab === TAB.Requests}
              onClick={() => setTab(TAB.Requests)}
            >
              Заявки ({requests.length})
            </Tabs.Tab>
            {!requestonly && (
              <>
                <Tabs.Tab
                  icon="shopping-cart"
                  textColor={tab !== TAB.Cart && amount > 0 && 'yellow'}
                  selected={tab === TAB.Cart}
                  onClick={() => setTab(TAB.Cart)}
                >
                  Заказ ({amount})
                </Tabs.Tab>
                <Tabs.Tab
                  icon="question"
                  selected={tab === TAB.Help}
                  onClick={() => setTab(TAB.Help)}
                >
                  Помощь
                </Tabs.Tab>
              </>
            )}
          </Tabs>
        </Section>
      </Stack.Item>
      <Stack.Item grow mt={-1}>
        {tab === TAB.Catalog && <CargoCatalog />}
        {tab === TAB.Requests && <CargoRequests />}
        {tab === TAB.Cart && <CargoCart />}
        {tab === TAB.Help && <CargoHelp />}
      </Stack.Item>
    </Stack>
  );
}
