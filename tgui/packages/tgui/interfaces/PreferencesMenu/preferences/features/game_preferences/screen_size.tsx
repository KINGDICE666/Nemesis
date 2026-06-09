import { CheckboxInput, type FeatureToggle } from '../base';

export const widescreenpref: FeatureToggle = {
  name: 'Включить широкий экран',
  category: 'UI',
  component: CheckboxInput,
};

export const fullscreen_mode: FeatureToggle = {
  name: 'Полноэкранный режим',
  category: 'UI',
  description: 'Переключает полноэкранный режим игры. Также можно переключить клавишей F11.',
  component: CheckboxInput,
};
