import { CheckboxInput, type FeatureToggle } from '../base';

export const status_bar: FeatureToggle = {
  name: 'Строка состояния',
  category: 'UI',
  description: `
      Если включено, в левом нижнем углу экрана будет отображаться
      имя объекта под курсором.
    `,
  component: CheckboxInput,
};
