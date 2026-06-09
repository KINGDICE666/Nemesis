import { createDropdownInput, type Feature } from '../base';

export const multiz_performance: Feature<number> = {
  name: 'Глубина Multi-Z',
  category: 'GAMEPLAY',
  description:
    'Сколько уровней Multi-Z отрисовывается до отсечения. Уменьшите значение, если multi-z карты лагают.',
  component: createDropdownInput({
    [-1]: 'Без отсечения',
    2: 'Высокая',
    1: 'Средняя',
    0: 'Низкая',
  }),
};
