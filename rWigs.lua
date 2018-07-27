local bar = BigWigs:GetPlugin("Bars", true)


do
	-- RehokUI
	local backdropBorder = {
		edgeFile = "Interface\\Buttons\\WHITE8X8",
		tile = false, tileSize = 0, edgeSize = 1,
		insets = {left = 0, right = 0, top = 0, bottom = 0}
	}
	
		local function removeStyle(bar)
			bar.candyBarBackdrop:Hide()
			local height = bar:Get("bigwigs:restoreheight")
			if height then
				bar:SetHeight(height)
			end
	
			local tex = bar:Get("bigwigs:restoreicon")
			if tex then
				bar:SetIcon(tex)
				bar:Set("bigwigs:restoreicon", nil)
	
				bar.candyBarIconFrameBackdrop:Hide()
			end
	
			bar.candyBarDuration:ClearAllPoints()
			bar.candyBarDuration:SetPoint("TOPLEFT", bar.candyBarBar, "TOPLEFT", 0, 0)
			bar.candyBarDuration:SetPoint("BOTTOMRIGHT", bar.candyBarBar, "BOTTOMRIGHT", 0, 0)
	
			bar.candyBarLabel:ClearAllPoints()
			bar.candyBarLabel:SetPoint("TOPLEFT", bar.candyBarBar, "TOPLEFT", -32, 0)
			bar.candyBarLabel:SetPoint("BOTTOMRIGHT", bar.candyBarBar, "BOTTOMRIGHT", -5, 0)
		end
	
		local function styleBar(bar)
			local height = bar:GetHeight()
			bar:Set("bigwigs:restoreheight", height)
			bar:SetHeight(height/2)
	
			local bd = bar.candyBarBackdrop
	
			bd:SetBackdrop(backdropBorder)
			bd:SetBackdropColor(.1,.1,.1,1)
			bd:SetBackdropBorderColor(0,0,0,1)
	
			bd:ClearAllPoints()
			bd:SetPoint("TOPLEFT", bar, "TOPLEFT", -1, 1)
			bd:SetPoint("BOTTOMRIGHT", bar, "BOTTOMRIGHT", 1, -1)
			bd:Show()
	
			local tex = bar:GetIcon()
			if tex then
				local icon = bar.candyBarIconFrame
				bar:SetIcon(nil)
				icon:SetTexture(tex)
				icon:Show()
				if bar.iconPosition == "RIGHT" then
					icon:SetPoint("BOTTOMLEFT", bar, "BOTTOMRIGHT", 3, 0) -- 5, 0
				else
					icon:SetPoint("BOTTOMRIGHT", bar, "BOTTOMLEFT", -3, 0) -- -5, 0
				end
				icon:SetSize(height, height)
				bar:Set("bigwigs:restoreicon", tex)
	
				local iconBd = bar.candyBarIconFrameBackdrop
				iconBd:SetBackdrop(backdropBorder)
				iconBd:SetBackdropColor(.1,.1,.1,1)
				iconBd:SetBackdropBorderColor(0,0,0,1)
	
				iconBd:ClearAllPoints()
				iconBd:SetPoint("TOPLEFT", icon, "TOPLEFT", -1, 1) -- -2, 2
				iconBd:SetPoint("BOTTOMRIGHT", icon, "BOTTOMRIGHT", 1, -1) -- 2, -2
				iconBd:Show()
			end
	
			bar.candyBarLabel:ClearAllPoints()
			bar.candyBarLabel:SetPoint("BOTTOMLEFT", bar.candyBarBar, "TOPLEFT", -1, 2)
	
			bar.candyBarDuration:ClearAllPoints()
			bar.candyBarDuration:SetPoint("BOTTOMRIGHT", bar.candyBarBar, "TOPRIGHT", 3, 2)
		end
	
        bar:RegisterBarStyle("RehokUI", {
            apiVersion = 1,
			version = 1,
			barHeight = 20,
			fontSizeNormal = 10,
			fontSizeEmphasized = 11,
			GetSpacing = function(bar) return bar:GetHeight()+7 end,
			ApplyStyle = styleBar,
			BarStopped = removeStyle,
			GetStyleName = function() return "RehokUI" end,
        })
	
	end