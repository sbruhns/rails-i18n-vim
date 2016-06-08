ruby $LOAD_PATH.unshift File.join(File.dirname(Vim.evaluate('expand("<sfile>")')), 'lib')

function! GoToTranslation()
ruby <<EOF

  require 'rails_i18n_lib'
  Vim.command("call inputsave()")
  locale = Vim.evaluate("input('Locale: ')")
  Vim.command("call inputrestore()")
  path = "config/locales/#{locale}.yml"

  current_cword = Vim.evaluate('expand("<cWORD>")')
  translation_key = current_cword.scan(/t\(\s*[\"|\']([\w|\.]+)[\"|\']\s*\)/).first.first
  if !translation_key.nil? && RailsI18nLib.key_exist?(path, translation_key)
     line = RailsI18nLib.get_line_for_key(path ,translation_key)
  else
    line = 0
  end
 
  Vim.command("e #{path}")
  current_window = VIM::Window.current
  current_window.cursor = [line, 0]
EOF
endfunction

command! GoToTranslation call GoToTranslation()
