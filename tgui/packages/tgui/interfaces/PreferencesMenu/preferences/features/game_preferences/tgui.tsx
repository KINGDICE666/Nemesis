import { CheckboxInput, type FeatureToggle } from '../base';

export const tgui_input: FeatureToggle = {
  name: 'Ввод: включить TGUI',
  category: 'UI',
  description: 'Отображает окна ввода через TGUI.',
  component: CheckboxInput,
};

export const tgui_input_large: FeatureToggle = {
  name: 'Ввод: крупные кнопки',
  category: 'UI',
  description: 'Делает кнопки TGUI крупнее и удобнее.',
  component: CheckboxInput,
};

export const tgui_input_swapped: FeatureToggle = {
  name: 'Ввод: поменять кнопки подтверждения/отмены',
  category: 'UI',
  description: 'Меняет расположение кнопок подтверждения и отмены.',
  component: CheckboxInput,
};

export const tgui_lock: FeatureToggle = {
  name: 'Закрепить TGUI на основном мониторе',
  category: 'UI',
  description: 'Закрепляет окна TGUI на основном мониторе.',
  component: CheckboxInput,
};

export const ui_scale: FeatureToggle = {
  name: 'Масштабирование UI',
  category: 'UI',
  description: 'Должны ли интерфейсы масштабироваться под масштаб монитора.',
  component: CheckboxInput,
};

export const tgui_say_light_mode: FeatureToggle = {
  name: 'Say: светлая тема',
  category: 'UI',
  description: 'Включает светлую тему для TGUI Say.',
  component: CheckboxInput,
};
