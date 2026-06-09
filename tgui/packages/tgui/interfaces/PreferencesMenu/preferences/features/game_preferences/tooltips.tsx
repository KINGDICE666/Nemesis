import {
  CheckboxInput,
  type Feature,
  FeatureNumberInput,
  type FeatureToggle,
} from '../base';

export const enable_tips: FeatureToggle = {
  name: 'Включить подсказки',
  category: 'TOOLTIPS',
  description: `
    Показывать подсказки при наведении на предметы?
  `,
  component: CheckboxInput,
};

export const tip_delay: Feature<number> = {
  name: 'Задержка подсказок (мс)',
  category: 'TOOLTIPS',
  description: `
    Через сколько миллисекунд показывать подсказку при наведении?
  `,
  component: FeatureNumberInput,
};
