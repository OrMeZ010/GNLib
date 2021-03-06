local PANEL = {}

AccessorFunc( PANEL, "x_align", "AlignX" )
AccessorFunc( PANEL, "y_align", "AlignY" )

function PANEL:Init()
    self.color = GNLib.Colors.Silver

    self.text = "Label"
    self.font = "GNLFontB15"

    self.x_align = TEXT_ALIGN_CENTER
    self.y_align = TEXT_ALIGN_CENTER

    self:UpdateSize()
end

function PANEL:UpdateSize()
    surface.SetFont( self.font or "GNLFontB15" )
    local tw, th = surface.GetTextSize( self.text or "" )
    self:SetSize( math.max( self:GetWide(), tw + 25 ), math.max( self:GetTall(), th + 4 ) )
end    
--  > Change size on font and text update

function PANEL:SetText( text )
    self.text = text

    self:UpdateSize()
end

function PANEL:GetText()
    return self.text
end

function PANEL:SetFont( font )
    self.font = font

    self:UpdateSize()
end

function PANEL:GetFont()
    return self.font
end

--  > Override existing
function PANEL:Paint( w, h )
    draw.SimpleText( self.text, self.font, (self.x_align == TEXT_ALIGN_LEFT) and 0 or (self.x_align == TEXT_ALIGN_CENTER) and w / 2 or (self.x_align == TEXT_ALIGN_RIGHT) and w, (self.y_align == TEXT_ALIGN_TOP) and 0 or (self.y_align == TEXT_ALIGN_CENTER) and h / 2 or (self.y_align == TEXT_ALIGN_BOTTOM) and h, self.color, self.x_align, self.y_align )
end

vgui.Register( "GNLabel", PANEL, "GNPanel" )
