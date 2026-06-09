import { CheckboxInputInverse, type FeatureToggle } from '../base';

export const hotkeys: FeatureToggle = {
  name: 'Классические хоткеи',
  category: 'GAMEPLAY',
  description:
    'Если включено, используются старые хоткеи с панелью ввода вместо всплывающих окон.',
  component: CheckboxInputInverse,
};
