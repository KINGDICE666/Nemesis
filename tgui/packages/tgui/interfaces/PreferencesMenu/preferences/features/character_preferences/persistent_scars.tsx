import { CheckboxInput, type FeatureToggle } from '../base';

export const persistent_scars: FeatureToggle = {
  name: 'Постоянные шрамы',
  description:
    'If checked, scars will persist across rounds if you survive to the end.',
  component: CheckboxInput,
};
