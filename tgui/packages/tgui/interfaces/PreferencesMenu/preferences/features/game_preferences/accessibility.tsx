import { CheckboxInput, type Feature, type FeatureToggle, FeatureSliderInput } from '../base';

export const darkened_flash: FeatureToggle = {
  name: 'Затемнять вспышки',
  category: 'ACCESSIBILITY',
  description: `
    Если включено, ослепление будет показывать тёмный экран вместо яркого.
  `,
  component: CheckboxInput,
};

export const screen_shake_darken: FeatureToggle = {
  name: 'Затемнять тряску экрана',
  category: 'ACCESSIBILITY',
  description: `
      Если включено, тряска экрана будет затемнять изображение.
    `,
  component: CheckboxInput,
};

export const remove_double_click: FeatureToggle = {
  name: 'Убрать двойной клик',
  category: 'ACCESSIBILITY',
  description: `
      Если включено, действия с двойным кликом предложат альтернативы.
    `,
  component: CheckboxInput,
};

export const min_recoil_multiplier: Feature<number> = {
  name: 'Сила визуальной отдачи',
  category: 'ACCESSIBILITY',
  description: `
      Меняет силу визуального эффекта отдачи камеры.
      0 полностью отключит визуальную отдачу, но механическая отдача не изменится.
    `,
  component: FeatureSliderInput,
};

export const stair_indicator: FeatureToggle = {
  name: 'Индикатор лестниц',
  category: 'ACCESSIBILITY',
  description: `
      Если включено, лестницы будут показывать направление перехода между этажами.
    `,
  component: CheckboxInput,
};

export const twelve_hour: FeatureToggle = {
  name: '12-часовой формат времени',
  category: 'ACCESSIBILITY',
  description: `
      Если включено, реальное время будет чаще показываться в формате AM/PM.
    `,
  component: CheckboxInput,
};
