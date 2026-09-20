local Library={}​
local TweenService=game:GetService("TweenService")​
local UserInputService=game:GetService("UserInputService")​
local CoreGui=game:GetService("CoreGui")​
function Library:CreateWindow(TitleText)​
local ScreenGui=Instance.new("ScreenGui")​
ScreenGui.Name="DipdarkUI"​
ScreenGui.Parent=CoreGui​
local MainFrame=Instance.new("Frame")​
MainFrame.Name="MainFrame"​
MainFrame.Parent=ScreenGui​
MainFrame.BackgroundColor3=Color3.fromRGB(15,15,15)​
MainFrame.Position=UDim2.new(0.3,0,0.3,0)​
MainFrame.Size=UDim2.new(0,500,0,350)​
MainFrame.ClipsDescendants=true​
local MainCorner=Instance.new("UICorner")​
MainCorner.CornerRadius=UDim.new(0,10)​
MainCorner.Parent=MainFrame​
local TopBar=Instance.new("Frame")​
TopBar.Name="TopBar"​
TopBar.Parent=MainFrame​
TopBar.BackgroundColor3=Color3.fromRGB(25,25,25)​
TopBar.Size=UDim2.new(1,0,0,40)​
local TopCorner=Instance.new("UICorner")​
TopCorner.CornerRadius=UDim.new(0,10)​
TopCorner.Parent=TopBar​
local TopFix=Instance.new("Frame")​
TopFix.Parent=TopBar​
TopFix.BackgroundColor3=Color3.fromRGB(25,25,25)​
TopFix.BorderSizePixel=0​
TopFix.Position=UDim2.new(0,0,0.5,0)​
TopFix.Size=UDim2.new(1,0,0.5,0)​
local Title=Instance.new("TextLabel")​
Title.Parent=TopBar​
Title.BackgroundTransparency=1​
Title.Position=UDim2.new(0,15,0,0)​
Title.Size=UDim2.new(1,-15,1,0)​
Title.Font=Enum.Font.GothamBold​
Title.Text=TitleText​
Title.TextColor3=Color3.fromRGB(255,255,255)​
Title.TextSize=16​
Title.TextXAlignment=Enum.TextXAlignment.Left​
local CloseBtn=Instance.new("TextButton")​
CloseBtn.Parent=TopBar​

CloseBtn.BackgroundTransparency=1​
CloseBtn.Position=UDim2.new(1,-40,0,0)​
CloseBtn.Size=UDim2.new(0,40,1,0)​
CloseBtn.Font=Enum.Font.GothamBold​
CloseBtn.Text="X"​
CloseBtn.TextColor3=Color3.fromRGB(255,50,50)​
CloseBtn.TextSize=16​
local HideBtn=Instance.new("TextButton")​
HideBtn.Parent=TopBar​
HideBtn.BackgroundTransparency=1​
HideBtn.Position=UDim2.new(1,-80,0,0)​
HideBtn.Size=UDim2.new(0,40,1,0)​
HideBtn.Font=Enum.Font.GothamBold​
HideBtn.Text="-"​
HideBtn.TextColor3=Color3.fromRGB(255,255,255)​
HideBtn.TextSize=20​
local ContentContainer=Instance.new("Frame")​
ContentContainer.Parent=MainFrame​
ContentContainer.BackgroundTransparency=1​
ContentContainer.Position=UDim2.new(0,0,0,40)​
ContentContainer.Size=UDim2.new(1,0,1,-40)​
local TabDrawer=Instance.new("Frame")​
TabDrawer.Name="TabDrawer"​
TabDrawer.Parent=MainFrame​
TabDrawer.BackgroundColor3=Color3.fromRGB(20,20,20)​
TabDrawer.Position=UDim2.new(0,-150,0,40)​
TabDrawer.Size=UDim2.new(0,150,1,-40)​
TabDrawer.ZIndex=5​
local DrawerCorner=Instance.new("UICorner")​
DrawerCorner.CornerRadius=UDim.new(0,10)​
DrawerCorner.Parent=TabDrawer​
local DrawerHandle=Instance.new("TextButton")​
DrawerHandle.Parent=TabDrawer​
DrawerHandle.BackgroundColor3=Color3.fromRGB(30,30,30)​
DrawerHandle.Position=UDim2.new(1,0,0.4,0)​
DrawerHandle.Size=UDim2.new(0,15,0,50)​
DrawerHandle.Text=">"​
DrawerHandle.TextColor3=Color3.fromRGB(255,255,255)​
DrawerHandle.Font=Enum.Font.GothamBold​
DrawerHandle.TextSize=14​
local HandleCorner=Instance.new("UICorner")​
HandleCorner.CornerRadius=UDim.new(0,5)​
HandleCorner.Parent=DrawerHandle​
local TabList=Instance.new("UIListLayout")​
TabList.Parent=TabDrawer​
TabList.SortOrder=Enum.SortOrder.LayoutOrder​
TabList.Padding=UDim.new(0,5)​
local DrawerOpen=false​

DrawerHandle.MouseButton1Click:Connect(function()​
DrawerOpen=not DrawerOpen​
if DrawerOpen then​
TweenService:Create(TabDrawer,TweenInfo.new(0.4,Enum.EasingStyle.Quart,Enum.EasingDir
ection.Out),{Position=UDim2.new(0,0,0,40)}):Play()​
DrawerHandle.Text="<"​
else​
TweenService:Create(TabDrawer,TweenInfo.new(0.4,Enum.EasingStyle.Quart,Enum.EasingDir
ection.Out),{Position=UDim2.new(0,-150,0,40)}):Play()​
DrawerHandle.Text=">"​
end​
end)​
local ContentFolder=Instance.new("Folder")​
ContentFolder.Parent=ContentContainer​
local IsHidden=false​
HideBtn.MouseButton1Click:Connect(function()​
IsHidden=not IsHidden​
if IsHidden then​
TweenService:Create(MainFrame,TweenInfo.new(0.5,Enum.EasingStyle.Quart,Enum.EasingDir
ection.Out),{Size=UDim2.new(0,500,0,40)}):Play()​
else​
TweenService:Create(MainFrame,TweenInfo.new(0.5,Enum.EasingStyle.Quart,Enum.EasingDir
ection.Out),{Size=UDim2.new(0,500,0,350)}):Play()​
end​
end)​
CloseBtn.MouseButton1Click:Connect(function()​
local
tw=TweenService:Create(MainFrame,TweenInfo.new(0.3,Enum.EasingStyle.Quart,Enum.Easin
gDirection.In),{Size=UDim2.new(0,0,0,0)})​
tw:Play()​
tw.Completed:Wait()​
ScreenGui:Destroy()​
end)​
local dragging,dragInput,dragStart,startPos​
local function update(input)​
local delta=input.Position-dragStart​
TweenService:Create(MainFrame,TweenInfo.new(0.1),{Position=UDim2.new(startPos.X.Scale,s
tartPos.X.Offset+delta.X,startPos.Y.Scale,startPos.Y.Offset+delta.Y)}):Play()​
end​
TopBar.InputBegan:Connect(function(input)​
if input.UserInputType==Enum.UserInputType.MouseButton1 or
input.UserInputType==Enum.UserInputType.Touch then​
dragging=true​

dragStart=input.Position​
startPos=MainFrame.Position​
input.Changed:Connect(function()​
if input.UserInputState==Enum.UserInputState.End then​
dragging=false​
end​
end)​
end​
end)​
TopBar.InputChanged:Connect(function(input)​
if input.UserInputType==Enum.UserInputType.MouseMovement or
input.UserInputType==Enum.UserInputType.Touch then​
dragInput=input​
end​
end)​
UserInputService.InputChanged:Connect(function(input)​
if input==dragInput and dragging then​
update(input)​
end​
end)​
local Window={}​
function Window:CreateTab(TabName)​
local TabBtn=Instance.new("TextButton")​
TabBtn.Parent=TabDrawer​
TabBtn.BackgroundColor3=Color3.fromRGB(30,30,30)​
TabBtn.Size=UDim2.new(1,-10,0,30)​
TabBtn.Position=UDim2.new(0,5,0,0)​
TabBtn.Font=Enum.Font.Gotham​
TabBtn.Text=TabName​
TabBtn.TextColor3=Color3.fromRGB(200,200,200)​
TabBtn.TextSize=14​
local TabBtnCorner=Instance.new("UICorner")​
TabBtnCorner.CornerRadius=UDim.new(0,5)​
TabBtnCorner.Parent=TabBtn​
local TabPage=Instance.new("ScrollingFrame")​
TabPage.Parent=ContentFolder​
TabPage.BackgroundTransparency=1​
TabPage.Size=UDim2.new(1,0,1,0)​
TabPage.CanvasSize=UDim2.new(0,0,0,0)​
TabPage.ScrollBarThickness=2​
TabPage.Visible=false​
local PageLayout=Instance.new("UIListLayout")​
PageLayout.Parent=TabPage​
PageLayout.SortOrder=Enum.SortOrder.LayoutOrder​
PageLayout.Padding=UDim.new(0,10)​
PageLayout.HorizontalAlignment=Enum.HorizontalAlignment.Center​
local PagePadding=Instance.new("UIPadding")​
PagePadding.Parent=TabPage​

PagePadding.PaddingTop=UDim.new(0,10)​
PagePadding.PaddingBottom=UDim.new(0,10)​
if #ContentFolder:GetChildren()==1 then​
TabPage.Visible=true​
TabBtn.TextColor3=Color3.fromRGB(255,255,255)​
end​
TabBtn.MouseButton1Click:Connect(function()​
for _,v in pairs(ContentFolder:GetChildren()) do v.Visible=false end​
for _,v in pairs(TabDrawer:GetChildren()) do if v:IsA("TextButton") and v~=DrawerHandle
then v.TextColor3=Color3.fromRGB(200,200,200) end end​
TabPage.Visible=true​
TabBtn.TextColor3=Color3.fromRGB(255,255,255)​
end)​
PageLayout:GetPropertyChangedSignal("AbsoluteContentSize"):Connect(function()​
TabPage.CanvasSize=UDim2.new(0,0,0,PageLayout.AbsoluteContentSize.Y+20)​
end)​
local TabContainer={}​
function TabContainer:CreateButton(BtnText,Callback)​
local Btn=Instance.new("TextButton")​
Btn.Parent=TabPage​
Btn.BackgroundColor3=Color3.fromRGB(35,35,35)​
Btn.Size=UDim2.new(0.9,0,0,35)​
Btn.Font=Enum.Font.Gotham​
Btn.Text=BtnText​
Btn.TextColor3=Color3.fromRGB(255,255,255)​
Btn.TextSize=14​
local BtnCorner=Instance.new("UICorner")​
BtnCorner.CornerRadius=UDim.new(0,6)​
BtnCorner.Parent=Btn​
Btn.MouseButton1Click:Connect(function()​
TweenService:Create(Btn,TweenInfo.new(0.1),{BackgroundColor3=Color3.fromRGB(50,50,50)})
:Play()​
task.wait(0.1)​
TweenService:Create(Btn,TweenInfo.new(0.1),{BackgroundColor3=Color3.fromRGB(35,35,35)})
:Play()​
pcall(Callback)​
end)​
end​
function TabContainer:CreateToggle(TogText,Default,Callback)​
local TogFrame=Instance.new("Frame")​
TogFrame.Parent=TabPage​
TogFrame.BackgroundColor3=Color3.fromRGB(35,35,35)​
TogFrame.Size=UDim2.new(0.9,0,0,35)​
local TogCorner=Instance.new("UICorner")​
TogCorner.CornerRadius=UDim.new(0,6)​
TogCorner.Parent=TogFrame​

local TogLabel=Instance.new("TextLabel")​
TogLabel.Parent=TogFrame​
TogLabel.BackgroundTransparency=1​
TogLabel.Position=UDim2.new(0,10,0,0)​
TogLabel.Size=UDim2.new(0.7,0,1,0)​
TogLabel.Font=Enum.Font.Gotham​
TogLabel.Text=TogText​
TogLabel.TextColor3=Color3.fromRGB(255,255,255)​
TogLabel.TextSize=14​
TogLabel.TextXAlignment=Enum.TextXAlignment.Left​
local TogBtn=Instance.new("TextButton")​
TogBtn.Parent=TogFrame​
TogBtn.BackgroundColor3=Color3.fromRGB(50,50,50)​
TogBtn.Position=UDim2.new(1,-45,0.5,-10)​
TogBtn.Size=UDim2.new(0,35,0,20)​
TogBtn.Text=""​
local TogBtnCorner=Instance.new("UICorner")​
TogBtnCorner.CornerRadius=UDim.new(1,0)​
TogBtnCorner.Parent=TogBtn​
local TogCircle=Instance.new("Frame")​
TogCircle.Parent=TogBtn​
TogCircle.BackgroundColor3=Color3.fromRGB(255,255,255)​
TogCircle.Position=UDim2.new(0,2,0.5,-8)​
TogCircle.Size=UDim2.new(0,16,0,16)​
local CircleCorner=Instance.new("UICorner")​
CircleCorner.CornerRadius=UDim.new(1,0)​
CircleCorner.Parent=TogCircle​
local Toggled=Default​
local function UpdateToggle()​
if Toggled then​
TweenService:Create(TogCircle,TweenInfo.new(0.3,Enum.EasingStyle.Quart,Enum.EasingDirec
tion.Out),{Position=UDim2.new(1,-18,0.5,-8)}):Play()​
TweenService:Create(TogBtn,TweenInfo.new(0.3),{BackgroundColor3=Color3.fromRGB(0,200,
100)}):Play()​
else​
TweenService:Create(TogCircle,TweenInfo.new(0.3,Enum.EasingStyle.Quart,Enum.EasingDirec
tion.Out),{Position=UDim2.new(0,2,0.5,-8)}):Play()​
TweenService:Create(TogBtn,TweenInfo.new(0.3),{BackgroundColor3=Color3.fromRGB(50,50,
50)}):Play()​
end​
pcall(Callback,Toggled)​
end​
TogBtn.MouseButton1Click:Connect(function()​
Toggled=not Toggled​

UpdateToggle()​
end)​
UpdateToggle()​
end​
function TabContainer:CreateSlider(SlidText,Min,Max,Default,Callback)​
local SlidFrame=Instance.new("Frame")​
SlidFrame.Parent=TabPage​
SlidFrame.BackgroundColor3=Color3.fromRGB(35,35,35)​
SlidFrame.Size=UDim2.new(0.9,0,0,55)​
local SlidCorner=Instance.new("UICorner")​
SlidCorner.CornerRadius=UDim.new(0,6)​
SlidCorner.Parent=SlidFrame​
local SlidLabel=Instance.new("TextLabel")​
SlidLabel.Parent=SlidFrame​
SlidLabel.BackgroundTransparency=1​
SlidLabel.Position=UDim2.new(0,10,0,5)​
SlidLabel.Size=UDim2.new(0.7,0,0,20)​
SlidLabel.Font=Enum.Font.Gotham​
SlidLabel.Text=SlidText​
SlidLabel.TextColor3=Color3.fromRGB(255,255,255)​
SlidLabel.TextSize=14​
SlidLabel.TextXAlignment=Enum.TextXAlignment.Left​
local SlidVal=Instance.new("TextLabel")​
SlidVal.Parent=SlidFrame​
SlidVal.BackgroundTransparency=1​
SlidVal.Position=UDim2.new(1,-60,0,5)​
SlidVal.Size=UDim2.new(0,50,0,20)​
SlidVal.Font=Enum.Font.Gotham​
SlidVal.Text=tostring(Default)​
SlidVal.TextColor3=Color3.fromRGB(200,200,200)​
SlidVal.TextSize=14​
SlidVal.TextXAlignment=Enum.TextXAlignment.Right​
local SlidBg=Instance.new("TextButton")​
SlidBg.Parent=SlidFrame​
SlidBg.BackgroundColor3=Color3.fromRGB(20,20,20)​
SlidBg.Position=UDim2.new(0,10,0,35)​
SlidBg.Size=UDim2.new(1,-20,0,10)​
SlidBg.Text=""​
local SlidBgCorner=Instance.new("UICorner")​
SlidBgCorner.CornerRadius=UDim.new(1,0)​
SlidBgCorner.Parent=SlidBg​
local SlidFill=Instance.new("Frame")​
SlidFill.Parent=SlidBg​
SlidFill.BackgroundColor3=Color3.fromRGB(0,200,100)​
SlidFill.Size=UDim2.new((Default-Min)/(Max-Min),0,1,0)​
local SlidFillCorner=Instance.new("UICorner")​
SlidFillCorner.CornerRadius=UDim.new(1,0)​
SlidFillCorner.Parent=SlidFill​

local dragging=false​
local function updateSlider(input)​
local
percent=math.clamp((input.Position.X-SlidBg.AbsolutePosition.X)/SlidBg.AbsoluteSize.X,0,1)​
local val=math.floor(Min+(Max-Min)*percent)​
TweenService:Create(SlidFill,TweenInfo.new(0.1),{Size=UDim2.new(percent,0,1,0)}):Play()​
SlidVal.Text=tostring(val)​
pcall(Callback,val)​
end​
SlidBg.InputBegan:Connect(function(input)​
if input.UserInputType==Enum.UserInputType.MouseButton1 or
input.UserInputType==Enum.UserInputType.Touch then​
dragging=true​
updateSlider(input)​
end​
end)​
UserInputService.InputEnded:Connect(function(input)​
if input.UserInputType==Enum.UserInputType.MouseButton1 or
input.UserInputType==Enum.UserInputType.Touch then​
dragging=false​
end​
end)​
UserInputService.InputChanged:Connect(function(input)​
if dragging and (input.UserInputType==Enum.UserInputType.MouseMovement or
input.UserInputType==Enum.UserInputType.Touch) then​
updateSlider(input)​
end​
end)​
end​
function TabContainer:CreateDropdown(DropText,Options,Callback)​
local DropFrame=Instance.new("Frame")​
DropFrame.Parent=TabPage​
DropFrame.BackgroundColor3=Color3.fromRGB(35,35,35)​
DropFrame.Size=UDim2.new(0.9,0,0,35)​
DropFrame.ClipsDescendants=true​
local DropCorner=Instance.new("UICorner")​
DropCorner.CornerRadius=UDim.new(0,6)​
DropCorner.Parent=DropFrame​
local DropBtn=Instance.new("TextButton")​
DropBtn.Parent=DropFrame​
DropBtn.BackgroundTransparency=1​
DropBtn.Size=UDim2.new(1,0,0,35)​
DropBtn.Font=Enum.Font.Gotham​
DropBtn.Text=" "..DropText​
DropBtn.TextColor3=Color3.fromRGB(255,255,255)​
DropBtn.TextSize=14​
DropBtn.TextXAlignment=Enum.TextXAlignment.Left​

local DropIcon=Instance.new("TextLabel")​
DropIcon.Parent=DropFrame​
DropIcon.BackgroundTransparency=1​
DropIcon.Position=UDim2.new(1,-30,0,0)​
DropIcon.Size=UDim2.new(0,30,0,35)​
DropIcon.Font=Enum.Font.GothamBold​
DropIcon.Text="+"​
DropIcon.TextColor3=Color3.fromRGB(255,255,255)​
DropIcon.TextSize=18​
local DropList=Instance.new("UIListLayout")​
DropList.Parent=DropFrame​
DropList.SortOrder=Enum.SortOrder.LayoutOrder​
DropList.Padding=UDim.new(0,2)​
local isOpen=false​
DropBtn.MouseButton1Click:Connect(function()​
isOpen=not isOpen​
if isOpen then​
TweenService:Create(DropFrame,TweenInfo.new(0.3),{Size=UDim2.new(0.9,0,0,35+(#Options*
30))}):Play()​
DropIcon.Text="-"​
else​
TweenService:Create(DropFrame,TweenInfo.new(0.3),{Size=UDim2.new(0.9,0,0,35)}):Play()​
DropIcon.Text="+"​
end​
end)​
for _,opt in pairs(Options) do​
local OptBtn=Instance.new("TextButton")​
OptBtn.Parent=DropFrame​
OptBtn.BackgroundColor3=Color3.fromRGB(45,45,45)​
OptBtn.Size=UDim2.new(1,0,0,28)​
OptBtn.Font=Enum.Font.Gotham​
OptBtn.Text=opt​
OptBtn.TextColor3=Color3.fromRGB(200,200,200)​
OptBtn.TextSize=14​
local OptCorner=Instance.new("UICorner")​
OptCorner.CornerRadius=UDim.new(0,4)​
OptCorner.Parent=OptBtn​
OptBtn.MouseButton1Click:Connect(function()​
DropBtn.Text=" "..DropText.." : "..opt​
isOpen=false​
TweenService:Create(DropFrame,TweenInfo.new(0.3),{Size=UDim2.new(0.9,0,0,35)}):Play()​
DropIcon.Text="+"​
pcall(Callback,opt)​
end)​
end​

end​
return TabContainer​
end​
return Window​
end​
