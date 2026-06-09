import { CheckboxInput, type FeatureToggle } from '../base';

export const itemoutline_pref: FeatureToggle = {
  name: 'Обводка предметов',
  category: 'GAMEPLAY',
  description: 'Если включено, предметы подсвечиваются обводкой при наведении.',
  component: CheckboxInput,
};
