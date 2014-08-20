
$(document).ready(function () {

  // map!
  // split out searchable names & include geos
  // download CSV feature
  // imiplement rest of documentation
  // front page

  var dispatch = d3.dispatch("load", "statechange");

  var groups = [
    "house_cost",
    "childcare_cost",
    "health_cost",
    "food_cost",
    "trans_cost",
    "other_cost",
    "tax"
  ];

  var descriptions = [
    {
      "topic": "income_hrly",
      "alias": "Living Wage",
      "description":"The living wage is an estimate of a family’s basic needs budget.  This wage includes the cost of food, childcare, healthcare costs, housing, transportation and other necessities, each adjusted for inflation when necessary into 2013 dollars. For further detail, please reference the technical documentation here."
    },
    {
      "topic": "house_cost",
      "alias": "Housing Cost",
      "description":"Housing costs measure the fair-market rent of rental housing, including utility costs, using HUD Fair Market Rents estimates for 2014. For further detail, please reference the technical documentation here."
    },
    {
      "topic": "childcare_cost",
      "alias": "Childcare Cost",
      "description":"Child care cost represents the lowest cost option, either family child care or child care center, by state as reported by the National Association of Child Care Resource and Referral Agencies in 2013 and are adjusted for inflation.For further detail, please reference the technical documentation here."
    },
    {
      "topic": "health_cost",
      "alias": "Healthcare Cost",
      "description":"Medical costs are the sum of expenses for insurance premiums and (1) health insurance costs for employer sponsored plans, (3) medical services, (3) drugs, and (4) medical supplies.  Health insurance costs were calculated using the Health Insurance Component Analytical Tool (MEPSnet/IC) provided online by the Agency for Healthcare Research and Quality.  All other costs were estimated using 2012 data from the 2013 Bureau of Labor Statistics Consumer Expenditure Survey, adjusted by region and for inflation.For further detail, please reference the technical documentation here."
    },
    {
      "topic": "food_cost",
      "alias": "Food Cost",
      "description":"Food cost is estimated using the US Department of Agriculture’s low-cost food plan as of 2013, adjusted for inflation.  The low-cost plan assumes that all meals (including snacks) are prepared in the home. For further detail, please reference the technical documentation here."
    },
    {
      "topic": "trans_cost",
      "alias": "Transportation Cost",
      "description": "Transportation costs are a measure of the expenses for (1) Used cars and trucks, (2) gasoline and motor oil, (3) other vehicle expenses, and (4) public transportation.  Expenditures for transportation are based on 2012 data by household size from the 2013 Bureau of Labor Statistics Consumer Expenditure Survey and are adjusted for regional variation and inflation. For further detail, please reference the technical documentation here."
    },
    {
      "topic": "other_cost",
      "alias": "Other Costs",
      "description":"Other necessities include expenses for (1) apparel and services, (2) housekeeping supplies, (3) personal care products and services, (4) reading, and (5) miscellaneous.  Expenditures for other necessities are based on 2012 data by household size from the 2013 Bureau of Labor Statistics Consumer Expenditure Survey and are adjusted for regional variation and inflation. For further detail, please reference the technical documentation here."
    },
    {
      "topic": "poverty_hrly",
      "alias": "Poverty Wage",
      "description": "The poverty wage is the maximum wage a family may earn and still be considered in poverty and qualify for specific forms of government aid.  The poverty wage should be understood as a yardstick of whether a family is under economic stress, not a measure of basic needs for living expenses. For further detail, please reference the technical documentation here."
    },
    {
      "topic": "minwage_hrly",
      "alias": "Minimum Wage",      
      "description": "The minimum wage is the lowest wage that is legally allowed in the United States, for most types of work.  Reported here is the national prevailing minimum wage or state minimum wage, whichever is higher, as of 2012. For further detail, please reference the technical documentation here."
    },
    {
      "topic": "tax",
      "alias": "Taxes",
      "description": "Taxes include estimates for payroll taxes, state income tax, and federal income taxes. Payroll taxes (Social Security and Medicare taxes) were 6.2% of total wages in 2013, as specified in the Federal Insurance Contributions Act. The state tax rate is taken from the second lowest income tax rate for 2011 as reported in the CCH State Tax Handbook. The federal income tax is calculated by the Tax Policy Center of the Urban Institute and Brookings Institution as of 2013. For further detail, please reference the technical documentation here."
    },
    {
      "topic": "adults",
      "alias": "Adults",
      "description": "Adults are members of a household above 18 years of age working full time, year-round 40 hour work weeks. For further detail, please reference the technical documentation here."
    },
    {
      "topic": "children",
      "alias": "Children",
      "description": "Children are those members of the household under 18 years of age. For further detail, please reference the technical documentation here."
    },
    {
      "topic": "occupation",
      "alias": "Occupation Data",
      "description": "The Bureau of Labor Statistics Occupation Employment Statistics Survey reports median wages for 22 major Standard Occupational Coded occupations in all 50 states, as of 2013. For further detail, please reference the technical documentation here."
    }
  ]

  var fam_composition_aliases = [
    {
      "type": "2A1LF0C", 
      "alias": "2 adults (1 in laborforce), 0 children"
    },
    {
      "type": "1A1C", 
      "alias": "1 adult, 1 child"
    },
    {
      "type": "2A1C", 
      "alias": "2 adults, 1 child"
    },
    {
      "type": "2A0C", 
      "alias": "2 adults, 0 children"
    },
    {
      "type": "2A2C", 
      "alias": "2 adults, 2 children"
    },
    {
      "type": "2A1LF1C", 
      "alias": "2 adults (1 in laborforce), 1 child"
    },
    {
      "type": "2A3C", 
      "alias": "2 adults, 3 children"
    },
    {
      "type": "1A3C", 
      "alias": "1 adult, 3 children"
    },
    {
      "type": "1A2C", 
      "alias": "1 adult, 2 children"
    },
    {
      "type": "2A1LF2C", 
      "alias": "2 adults (1 in laborforce), 2 children"
    },
    {
      "type": "1A0C", 
      "alias": "1 adult, 0 children"
    },
    {
      "type": "2A1LF3C", 
      "alias": "2 adults (1 in laborforce), 3 children"
    }
  ];

  var contribution_aliases = [
    {
      "type": "childcare_cost",
      "alias": "Childcare"
    },
    {
      "type": "health_cost",
      "alias": "Healthcare"
    },
    {
      "type": "food_cost",
      "alias": "Food"
    },
    {
      "type": "trans_cost",
      "alias": "Transportation"
    },
    {
      "type": "other_cost",
      "alias": "Other"
    },
    {
      "type": "house_cost",
      "alias": "Housing"
    }
,
    {
      "type": "tax",
      "alias": "Taxes"
    }
  ]

  var occupation_aliases = [
    {
      "code": "110000",
      "alias": "Management Occupations"
    },
    {
      "code": "130000",
      "alias": "Business and Financial Operations Occupations"
    },
    {
      "code": "150000",
      "alias": "Computer and Mathematical Occupations"
    },
    {
      "code": "170000",
      "alias": "Architecture and Engineering Occupations"
    },
    {
      "code": "190000",
      "alias": "Life, Physical, and Social Science Occupations"
    },
    {
      "code": "210000",
      "alias": "Community and Social Service Occupations"
    },
    {
      "code": "230000",
      "alias": "Legal Occupations"
    },
    {
      "code": "250000",
      "alias": "Education, Training, and Library Occupations"
    },
    {
      "code": "270000",
      "alias": "Arts, Design, Entertainment, Sports, and Media Occupations"
    },
    {
      "code": "290000",
      "alias": "Healthcare Practitioners and Technical Occupations"
    },
    {
      "code": "310000",
      "alias": "Healthcare Support Occupations"
    },
    {
      "code": "330000",
      "alias": "Protective Service Occupations"
    },
    {
      "code": "350000",
      "alias": "Food Preparation and Serving Related Occupations"
    },
    {
      "code": "370000",
      "alias": "Building and Grounds Cleaning and Maintenance Occupations"
    },
    {
      "code": "390000",
      "alias": "Personal Care and Service Occupations"
    },
    {
      "code": "410000",
      "alias": "Sales and Related Occupations"
    },
    {
      "code": "430000",
      "alias": "Office and Administrative Support Occupations"
    },
    {
      "code": "450000",
      "alias": "Farming, Fishing, and Forestry Occupations"
    },
    {
      "code": "470000",
      "alias": "Construction and Extraction Occupations"
    },
    {
      "code": "490000",
      "alias": "Installation, Maintenance, and Repair Occupations"
    },
    {
      "code": "510000",
      "alias": "Production Occupations"
    },
    {
      "code": "530000",
      "alias": "Transportation and Material Moving Occupations"
    }
  ];

  var dollars = d3.format(",.2f");

  // A drop-down menu for selecting a state; uses the "menu" namespace.
  dispatch.on("load.menu", function(stateById) {
    var select = d3.select("#donut-chart-menu")
      .append("select")
        .attr("class", "form-control input-sm")
        .on("change", function() { dispatch.statechange(stateById.get(this.value)); })

    select.selectAll("option")
        .data(stateById.values())
      .enter().append("option")
        .attr("value", function(d) { return d.familycomposition; })
        .text(function(d) {
          var alias = fam_composition_aliases.filter(function(m) {
            
            return m.type == d.familycomposition;
          });

          return alias[0].alias; 
        });

    dispatch.on("statechange.menu", function(state) {
       $("#contributions").empty(); 
      select.property("value", state.familycomposition);


    });
  });

  dispatch.on("load.wages", function(stateById) {

      var margin = {top: 20, right: 10, bottom: 30, left: 10},
          width = parseInt(d3.select("#living-wage-append").style('width'), 10) - margin.left - margin.right,
          height = 300;

      var container = d3.select("#living-wage-append")
            .append("svg")
              .attr("width", width + margin.left + margin.right)
              .attr("height", height + margin.top + margin.bottom);

      var x = d3.scale.ordinal()
          .rangeRoundBands([0, width], .1);

      var y = d3.scale.linear()
          .range([height, 0]);

      var xAxis = d3.svg.axis()
          .scale(x)
          .orient("bottom")
          .tickValues(["Living Wage", "Minimum Wage", "Poverty Wage"]);

      var formatCurrency = d3.format(".1f");

      var yAxis = d3.svg.axis()
          .scale(y)
          .orient("left")
          .ticks(10)
          .tickFormat(function(d) { return "$" + formatCurrency(d); });

      var barHeights = 0

      x.domain(["income_hrly","minwage_hrly","poverty_hrly"])

      var barChartArea = container.append("g")
            .attr("transform", "translate(" + margin.left + "," + margin.top + ")");

      barChartArea.append("g")
          .attr("class", "x axis")
          .attr("transform", "translate(0," + height + ")")
          .call(xAxis);

      var bars = barChartArea.selectAll(".bar")
          .data(x.domain())
        .enter().append("rect")
          .attr("class", "bar")
          .attr("id", function(d) {
            return "bar-" + d;
          })
          .attr("x", function(d) { return x(d); })
          .attr("y", function() { return y(0); })
          .attr("width", x.rangeBand())
          .attr("height", 0)

      var text = barChartArea.selectAll(".text")  
          .data(x.domain())
        .enter().append("text")
          .attr("class", "bartext")
          .attr("id", function(d) {
            return "text-" + d;
          })
          .attr("text-anchor", "middle")
          .attr("dy", ".35em")

    dispatch.on("statechange.wages", function(d) {

        var data = d.wages;

        // x.domain(data.map(function(d) { return d.name; }));
        y.domain([0, d3.max(data, function(d) { return d.value; })]);

        bars.data(data)
            .attr("data-title", function(d) {
              var alias = descriptions.filter(function(m) {
                return m.topic == d.name;
              });
              return alias[0].alias; 

            })
            .attr("data-content", function(d) { 
              var alias = descriptions.filter(function(m) {
                return m.topic == d.name;
              });

              var body = '<table id="one-column-emphasis"><colgroup><col class="oce-first"></col></colgroup><tbody>' +
                     '<tr><td>Hourly:</td><td>$' + (d.value).toString() + '</td></tr>' +
                     '<tr><td>Weekly:</td><td>$' + (d.value * 40).toString() + '</td></tr>' +
                     '<tr><td>Annual:</td><td>$' + (d.value * 2085).toString() + '</td></tr></tbody><table>' +
                     alias[0].description;
              
              return body;
            })
          .transition()
            .attr("y", function(d) { return y(d.value); })
            .attr("height", function(d) { return height - y(d.value); });

        text.data(data)
          .transition()
            .attr("x", function(d, i) { return x(i)+x.rangeBand(d.name)/2; })
            .attr("y", function(d) { return y(d.value/2); })
            .text(function (d) { return "$" + d.value });


        function type(d) {
          d.value = +d.value; // coerce to number
          return d;
        }

    });
  });

  dispatch.on("load.occupations", function(stateById) {

    var div = d3.select('#occupations-data tbody');

      var highest_salary = d3.max(gon.occupations, function(d) { return d.occ_salary; });
      var y = d3.scale.linear()
        .range([0, 150])
        .domain([0, highest_salary]);

      var types = div.selectAll("td")
          .data(gon.occupations)
          .enter()
            .append("tr")
            .attr("class", "body");

        types.append("td")
          .text(function(d) { 
            var alias = occupation_aliases.filter(function(m) {
              return "occ_" + m.code == d.occ_type;
            });

            return alias[0].alias; 
          });

        types.append("td")
          .append("span")
          .style("display", "block")
          .style("background-color", "#ffffff")
          .style("width", function(d) {
            return y(d.occ_salary) + "px"
          })
          .text(function(d) { return "$" + dollars(d.occ_salary); });

    dispatch.on("statechange.occupations", function(d) {

      var living_salary = d.income[0].value;

      d3.selectAll("#occupations-data tbody tr.body span")
        .transition(600)
          .style("background-color", function(d) {
          if (living_salary < d.occ_salary) {
            return "rgb(77,175,74)";
          } else {
            return "rgb(228,26,28)";
          }
      });


    });
  });

  // A pie chart to show population by age group; uses the "pie" namespace.
  dispatch.on("load.pie", function(stateById) {

    var width = parseInt(d3.select("#living-wage-append").style('width'), 10),
        height = 350,
        radius = Math.min(width, height) / 2,
        labelr = radius + 15;

    var color = d3.scale.ordinal()
        .domain(groups)
        .range(["#a65628","#377eb8","#e41a1c","#4daf4a","#ff7f00","#984ea3", "#666666"]);

    var arc = d3.svg.arc()
        .outerRadius(radius - 20)
        .innerRadius(radius - 125);

    var pie = d3.layout.pie()
        .sort(null);

    var pieChartArea = d3.select("#living-wage-pie").append("svg")
        .attr("width", width)
        .attr("height", height)
      .append("g")
        .attr("transform", "translate(" + (width / 2) + "," + height / 2 + ")");

    var path = pieChartArea.selectAll("path")
        .data(groups)
      .enter().append("path")
        .style("fill", color)
        .each(function() { this._current = {startAngle: 0, endAngle: 0}; })

    var labels = pieChartArea.selectAll(".pie-text text")
        .data(groups)
      .enter().append("svg:text")
        .attr("transform", "translate(0,0)")
        .attr("class", "pie-text")

    var categories = pieChartArea.selectAll(".categories text")
        .data(groups)
      .enter().append("svg:text")
        .attr("transform", "translate(0,0)")
        .attr("class", "categories")

    dispatch.on("statechange.pie", function(d) {

      var sum = 0;

      d.contributions.forEach(function(d) {
        sum = sum + d.value;
      });

      path.data(pie.value(function(g) { return d[g]; })(groups))
          .transition()
          .attrTween("d", function(d) {
            var interpolate = d3.interpolate(this._current, d);
            this._current = interpolate(0);
            return function(t) {
              return arc(interpolate(t));
            };
          });

      path.attr("data-content", function(d) { 
          var alias = descriptions.filter(function(m) {
            return m.topic == d.data;
          });

          return alias[0].description;
        })

      labels.data(pie.value(function(g) { return d[g]; })(groups))
          .transition()
          .attr("transform", function(d) {
              var c = arc.centroid(d),
                  x = c[0],
                  y = c[1],
                  // pythagorean theorem for hypotenuse
                  h = Math.sqrt(x*x + y*y);
              return "translate(" + x +  ',' +
                 y +  ")"; 
          })
          .attr("x", 0)
          .attr("y", 0)
          .attr("dy", ".71em")
          .style("text-anchor", function(d) {
              // are we past the center?
              return "middle";
          })
          .text(function(d, i) { 
            var alias = contribution_aliases.filter(function(m) {
              return m.type == d.data;
            });

            if (d.value !== 0) 
              { 
                return (d.value/sum * 100).toFixed(0) + "%"; 
              } 
          })

      categories.data(pie.value(function(g) { return d[g]; })(groups))
          .transition()
          .attr("transform", function(d) {
              var c = arc.centroid(d),
                  x = c[0],
                  y = c[1],
                  // pythagorean theorem for hypotenuse
                  h = Math.sqrt(x*x + y*y);
              return "translate(" + x +  ',' +
                 (y - 15) +  ")"; 
          })
          .attr("dy", ".71em")
          .style("text-anchor", function(d) {
              // are we past the center?
              return "middle";
          })
          .text(function(d, i) { 
            var alias = contribution_aliases.filter(function(m) {
              return m.type == d.data;
            });

            if (d.value !== 0) 
              { 
                return alias[0].alias + ": "; 
              } 
          })

    });
  });


  var stateById = d3.map();

  gon.contributions.forEach(function(d) { 
    var pluck = [];
    var contributions = [];
    var wages = [];

    console.log(d);

    for(var prop in d){
      pluck.push({ name: prop, value: d[prop] })
    }; 

    contributions = pluck.filter(function(d) { return d.name !== "familycomposition" && d.name !== "minwage_hrly" && d.name !== "income_hrly" && d.name !== "poverty_hrly" && d.name !== "income" });

    wages = pluck.filter(function(d) { return d.name == "minwage_hrly" || d.name == "income_hrly" || d.name == "poverty_hrly"  });

    var income = pluck.filter(function(d) { return d.name == "income"; })

    d.contributions = contributions;
    d.wages = wages;
    d.income = income;

    stateById.set(d.familycomposition, d); 
  });

  dispatch.load(stateById);
  dispatch.statechange(stateById.get("2A1C"));


  var format = d3.format(",.2f");
  var pct = d3.format("4%");

  var margin = {top: 1, left: 1, bottom: 20, right: 1}, 
    width = parseInt(d3.select('#national-landscape').style('width')), 
    width = width - margin.left - margin.right, 
    mapRatio = .5, 
    height = width * mapRatio,
    active = false;

  var projection = d3.geo.albersUsa()
      .scale(width)
      .translate([width / 2, height / 2]);

  var path = d3.geo.path()
      .projection(projection);

  var svg = d3.select("#national-landscape").append("svg")
      .attr("width", "100%")
      .attr("height", "100%");

  svg.append("rect")
      .attr("width", width)
      .attr("height", height);

  var g = svg.append("g");

  d3.json("../assets/us.json", function(error, us) {

    g.selectAll("path")
        .data(topojson.feature(us, us.objects.states).features)
      .enter().append("path")
        .attr("d", path)
        .attr("class", "feature")
        .on("mouseover", function(d) {
          d3.select(this)
            .style("opacity", "0.5")
        })
        .on("mouseout", function(d) {
          d3.select(this)
            .transition()
            .duration(350)
            .style("opacity", "1")
        });

    g.append("path")
        .datum(topojson.mesh(us, us.objects.states, function(a, b) { return a !== b; }))
        .attr("class", "mesh")
        .attr("d", path);

    });   

  function click(d) {
    if (active != false) return reset();
    var b = path.bounds(d);
    var a = path.area(d); 
    g.selectAll(".active").classed("active", false);
    d3.selectAll(".region-label").style("display", "none");
    d3.select(this).style("display", "none");  
    d3.select(this).classed("active", active = d);
    g.transition().duration(750).attr("transform",
        "translate(" + projection.translate() + ")"
        + "scale(" + .95 / Math.max((b[1][0] - b[0][0]) / width, (b[1][1] - b[0][1]) / height) + ")"
        + "translate(" + -(b[1][0] + b[0][0]) / 2 + "," + -(b[1][1] + b[0][1]) / 2 + ")")
    .each('end', function() {
      g.selectAll("circle").style("display", "block");
      g.selectAll(".place-label").style("display", "block");
      d3.selectAll(".state-label").style("display", "block");
    });

  }

  function reset() {
    g.selectAll(".active").classed("active", active = false);
    g.selectAll("circle").style("display", "none");
    d3.selectAll(".region-feature").style("display", "block");  
    d3.selectAll(".region-label").style("display", "block");    
    d3.selectAll(".state-label").style("display", "none");
    g.transition().duration(750).attr("transform", "");
    g.selectAll(".place-label").style("display", "none");
  }

  // Bootstrap & other UI 

  $("path").popover({
      'container': 'body',
      'placement': 'auto left',
      'trigger': 'hover',
      'html': true
  });

  $("rect").popover({
      'container': 'body',
      'placement': 'auto right',
      'trigger': 'hover',
      'html': true,
      'delay': { show: 0, hide: 300 }
  });

  $("#sticky-menu").stick_in_parent({offset_top: 51});

});
