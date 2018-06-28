// @flow
import { Directory, Disposable, GitRepository, TextEditor } from 'atom'

type CommandListenerFunction = (event: any) => void
type CommandListenerDescriptor = {
  didDispatch: CommandListenerFunction,
  description?: string,
  displayName?: string,
  hiddenInCommandPalette?: boolean
}
type CommandListener = CommandListenerFunction | CommandListenerDescriptor
type CommandListeners = {
  [name: string]: CommandListenerFunction
}

type PanelOptions = {
  item: HTMLElement | mixed,
  visible?: boolean,
  priority?: number,
  autoFocus?: boolean
}

type Panel = {
  destroy(): void
}

type NotificationButtonOptions = {
  className?: string,
  onDidClick?: Function,
  text: string
}
type NotificationOptions = {
  buttons?: NotificationButtonOptions[],
  description?: string,
  detail?: string,
  dismissable?: boolean,
  icon?: string
}
type ErrorNotificationOptions = NotificationOptions & { stack?: string }

type Notification = {}

type Atom = {
  commands: {
    add(target: string, commandName: string, listener: CommandListener): Disposable,
    add(target: string, commands: CommandListeners): Disposable
  },
  notifications: {
    addSuccess(message: string, ?NotificationOptions): Notification,
    addError(message: string, ?ErrorNotificationOptions): Notification
  },
  project: {
    repositoryForDirectory(Directory): Promise<GitRepository>
  },
  workspace: {
    addModalPanel(PanelOptions): Panel,
    getTextEditors(): TextEditor[],
    observeActiveTextEditor(callback: (editor: TextEditor | void) => any): Disposable
  }
}

declare var atom: Atom
