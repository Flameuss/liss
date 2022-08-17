-- aplicacao geral

import("publish")

descriptions = {
    arapiuns = {
        date = "Carried out from June 4th to 15th, 2012.",
        photo = {"Arapiuns.jpg"},
    },
    baixoTocantins = {
        date = "Carried out in 2018 and 2019.",
        photo = {"Baixo Tocantins 2018.jpg", "Baixo Tocantins 2019.jpg"},
    },
    BR230 = {
        date = "Carried out from October 6th to 18th, 2014.",
        photo = {"BR230.jpg"}
    },
    santarem = {
        date = "Carried out from September 6th to 26th, 2013.",
        photo = {"Santarem.jpg"}
    }
}

local description = [[
	This webpage describes LiSS fieldworks in the Brazilian Amazonia. Please click in a box to see more information and to navigate through specific applications.<br>Each of these fieldworks was funded by a set of agencies, shown in the respective application. The toolkit to create this application was partially funded by <a href="http://nexus.ccst.inpe.br/">Nexus project</a>, grant #2017/22269-2, São Paulo Research Foundation (FAPESP).
]]

Application{
    key = "AIzaSyA1coAth-Bo7m99rnxOm2oOBB88AmaSbOk",
	project = "fieldworks.tview",
	description = description,
	base = "roadmap",
    zoom = 7,
	template = {navbar = "darkblue", title = "white"},
    display = false,
	fieldworks = View{
        color = "Set2",
		select = "title",
        description = "Trabalhos de campo.",
		report = function(cell)
			local report = Report{
				title = cell.title,
				author = descriptions[cell.app].date
			}

            local link = "https://combinatronics.com/pedro-andrade-inpe/liss/main/en/"..
              cell.app.."/"..cell.app.."WebMap/index.html"

			report:addText("See the application <a href = \""..link.."\" target=\"_blank\">here</a>.")

            forEachElement(descriptions[cell.app].photo, function(_, value)
              report:addImage("photos/"..value)
            end)

			return report
		end
	}
}