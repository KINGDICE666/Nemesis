import {
  CheckboxInput,
  type Feature,
  type FeatureChoiced,
  FeatureColorInput,
  type FeatureToggle,
} from '../base';
import { FeatureDropdownInput } from '../dropdowns';

export const screentip_color: Feature<string> = {
  name: 'Screentips: цвет подсказок',
  category: 'UI',
  description: `
    Цвет экранных подсказок, которые появляются при наведении.
  `,
  component: FeatureColorInput,
};

export const screentip_images: FeatureToggle = {
  name: 'Screentips: картинки кнопок',
  category: 'UI',
  description: `Если включено, подсказки используют картинки кнопок мыши
    вместо текста ЛКМ/ПКМ.`,
  component: CheckboxInput,
};

export const screentip_pref: FeatureChoiced = {
  name: 'Screentips: включить подсказки',
  category: 'UI',
  description: `
    Включает экранные подсказки, которые появляются при наведении.
    В режиме "Только с подсказками" показывается только когда есть
    дополнительная информация, например действие правого клика.
  `,
  component: FeatureDropdownInput,
};
