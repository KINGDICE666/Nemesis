import { CheckboxInput, type FeatureToggle } from '../base';

export const ambientocclusion: FeatureToggle = {
  name: 'Фоновое затенение',
  category: 'GAMEPLAY',
  description: 'Включает ambient occlusion: лёгкие тени вокруг персонажей.',
  component: CheckboxInput,
};
