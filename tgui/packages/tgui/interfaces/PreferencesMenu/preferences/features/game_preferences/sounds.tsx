import {
  CheckboxInput,
  type Feature,
  type FeatureChoiced,
  FeatureSliderInput,
  type FeatureToggle,
} from '../base';
import { FeatureDropdownInput } from '../dropdowns';

export const sound_ambience_volume: Feature<number> = {
  name: 'Громкость окружения',
  category: 'SOUND',
  description: `Окружение - это заметные фоновые звуки, которые периодически проигрываются.`,
  component: FeatureSliderInput,
};

export const sound_breathing: FeatureToggle = {
  name: 'Звуки дыхания',
  category: 'SOUND',
  description: 'Если включено, при использовании интерналов будут слышны звуки дыхания.',
  component: CheckboxInput,
};

export const sound_announcements: FeatureToggle = {
  name: 'Звуки объявлений',
  category: 'SOUND',
  description: 'Если включено, будут слышны звуки отчётов командования, уведомлений и т.п.',
  component: CheckboxInput,
};

export const sound_ghost_poll_prompt: FeatureChoiced = {
  name: 'Звук опроса призраков',
  category: 'SOUND',
  description: 'Выберите звук, который проигрывается при получении опроса для призраков.',
  component: FeatureDropdownInput,
};

export const sound_ghost_poll_prompt_volume: Feature<number> = {
  name: 'Громкость опроса призраков',
  category: 'SOUND',
  description: 'Громкость звука опросов для призраков.',
  component: FeatureSliderInput,
};

export const sound_combatmode: FeatureToggle = {
  name: 'Звук боевого режима',
  category: 'SOUND',
  description: 'Если включено, переключение боевого режима будет сопровождаться звуком.',
  component: CheckboxInput,
};

export const sound_instruments: Feature<number> = {
  name: 'Громкость инструментов',
  category: 'SOUND',
  description: 'Громкость музыкальных инструментов.',
  component: FeatureSliderInput,
};

export const sound_jukebox: Feature<number> = {
  name: 'Громкость музыкального автомата',
  category: 'SOUND',
  description: 'Громкость треков музыкального автомата.',
  component: FeatureSliderInput,
};

export const sound_tts: FeatureChoiced = {
  name: 'Включить TTS',
  category: 'SOUND',
  description: `
    Если включено, в игре будет слышна озвучка текста.
    В режиме "Blips" озвучка заменяется короткими звуковыми сигналами на основе голоса.
  `,
  component: FeatureDropdownInput,
};

export const sound_tts_volume: Feature<number> = {
  name: 'Громкость TTS',
  category: 'SOUND',
  description: 'Громкость звуков text-to-speech.',
  component: FeatureSliderInput,
};

export const sound_lobby_volume: Feature<number> = {
  name: 'Громкость музыки лобби',
  category: 'SOUND',
  component: FeatureSliderInput,
};

export const sound_midi: Feature<number> = {
  name: 'Громкость админской музыки',
  category: 'SOUND',
  description: 'Громкость музыки, запускаемой администрацией.',
  component: FeatureSliderInput,
};

export const sound_ship_ambience_volume: Feature<number> = {
  name: 'Громкость фонового шума корабля',
  category: 'SOUND',
  description: `Фоновый шум корабля - это тихий гул, который проигрывается по кругу.`,
  component: FeatureSliderInput,
};

export const sound_achievement: FeatureChoiced = {
  name: 'Звук достижения',
  category: 'SOUND',
  description: `
    Звук, который проигрывается при получении достижения.
    Если отключено, звук проигрываться не будет.
  `,
  component: FeatureDropdownInput,
};

export const sound_ai_vox: Feature<number> = {
  name: 'Громкость VOX-объявлений ИИ',
  category: 'SOUND',
  description: 'Громкость голосовых объявлений ИИ, также известных как VOX.',
  component: FeatureSliderInput,
};
