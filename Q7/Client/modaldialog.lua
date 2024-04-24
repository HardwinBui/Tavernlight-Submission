modalDialog = nil
curHeight = 0
marginBottom = 0
updateXPos = false
xPivot = 0

function init()
  g_ui.importStyle('modaldialog')

  connect(g_game, { onModalDialog = onModalDialog,
                    onGameEnd = destroyDialog })

  local dialog = rootWidget:recursiveGetChildById('modalDialog')
  if dialog then
    modalDialog = {dialog}
  end
  updateHeight(50)
end

function updateHeight(h)
  curHeight = h
  marginBottom = curHeight - 25
end

function terminate()
  disconnect(g_game, { onModalDialog = onModalDialog,
                       onGameEnd = destroyDialog })
end

function destroyDialog()
  if modalDialog then
    modalDialog:destroy()
    modalDialog = nil
  end
end

function onModalDialog(id, title, message, buttons, enterButton, escapeButton, choices, priority, test)

  if modalDialog then
    --destroyDialog()
    --return
  end

  modalDialog = g_ui.createWidget('ModalDialog', rootWidget)
  local buttonsPanel = modalDialog:getChildById('buttonsPanel')

  modalDialog:setText('')

  
  if updateXPos then
    print("reset")
    updateXPos = false
    xPivot = 200 - tonumber(message) - 1
  end

  modalDialog:setHeight(300)
  modalDialog:setWidth(300)
  local button = g_ui.createWidget('ModalButton2', buttonsPanel)
  button:setText("Jump!")
  button.onClick = function(self)
                    updateHeight(math.random(50, 400))
                    updateXPos = true
  end

  local trueX = tonumber(message)

  button:setMarginLeft((trueX + xPivot) % 200)
  button:setMarginBottom(marginBottom)
  buttonsPanel:setHeight(curHeight)

  modalDialog.onEnter = enterFunc
  modalDialog.onEscape = escapeFunc
end