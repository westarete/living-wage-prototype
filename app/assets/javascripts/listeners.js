
$(document).ready(function () {

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
      "topic": "income_pretax_hrly",
      "alias": "Living Wage",
      "description":"The living wage is an estimate of a family’s basic needs budget.  This wage includes the cost of food, childcare, healthcare costs, housing, transportation, taxes, and other necessities, each adjusted for inflation when necessary into 2014 dollars. For further detail, please reference the <a href='/assets/Living-User-Guide-and-Technical-Notes-2014.pdf' target='_blank'>technical documentation here.</a>"
    },
    {
      "topic": "house_cost",
      "alias": "Housing Cost",
      "description":"Housing costs measure the fair-market rent of rental housing, including utility costs, using HUD Fair Market Rents estimates for 2014. For further detail, please reference the <a href='/assets/Living-User-Guide-and-Technical-Notes-2014.pdf' target='_blank'>technical documentation here.</a>"
    },
    {
      "topic": "childcare_cost",
      "alias": "Childcare Cost",
      "description":"Child care cost represents the lowest cost option, either family child care or child care center, by state as reported by the National Association of Child Care Resource and Referral Agencies in 2013 and are adjusted for inflation. For further detail, please reference the <a href='/assets/Living-User-Guide-and-Technical-Notes-2014.pdf' target='_blank'>technical documentation here.</a>"
    },
    {
      "topic": "health_cost",
      "alias": "Healthcare Cost",
      "description":"Medical costs are the sum of expenses for insurance premiums and (1) health insurance costs for employer sponsored plans, (3) medical services, (3) drugs, and (4) medical supplies.  Health insurance costs were calculated using the Health Insurance Component Analytical Tool (MEPSnet/IC) provided online by the Agency for Healthcare Research and Quality.  All other costs were estimated using 2012 data from the 2013 Bureau of Labor Statistics Consumer Expenditure Survey, adjusted by region and for inflation. For further detail, please reference the <a href='/assets/Living-User-Guide-and-Technical-Notes-2014.pdf' target='_blank'>technical documentation here.</a>"
    },
    {
      "topic": "food_cost",
      "alias": "Food Cost",
      "description":"Food cost is estimated using the US Department of Agriculture’s low-cost food plan as of 2013, adjusted for inflation.  The low-cost plan assumes that all meals (including snacks) are prepared in the home. For further detail, please reference the <a href='/assets/Living-User-Guide-and-Technical-Notes-2014.pdf' target='_blank'>technical documentation here.</a>"
    },
    {
      "topic": "trans_cost",
      "alias": "Transportation Cost",
      "description": "Transportation costs are a measure of the expenses for (1) Used cars and trucks, (2) gasoline and motor oil, (3) other vehicle expenses, and (4) public transportation.  Expenditures for transportation are based on 2012 data by household size from the 2013 Bureau of Labor Statistics Consumer Expenditure Survey and are adjusted for regional variation and inflation. For further detail, please reference the <a href='/assets/Living-User-Guide-and-Technical-Notes-2014.pdf' target='_blank'>technical documentation here.</a>"
    },
    {
      "topic": "other_cost",
      "alias": "Other Costs",
      "description":"Other necessities include expenses for (1) apparel and services, (2) housekeeping supplies, (3) personal care products and services, (4) reading, and (5) miscellaneous.  Expenditures for other necessities are based on 2012 data by household size from the 2013 Bureau of Labor Statistics Consumer Expenditure Survey and are adjusted for regional variation and inflation. For further detail, please reference the <a href='/assets/Living-User-Guide-and-Technical-Notes-2014.pdf' target='_blank'>technical documentation here.</a>"
    },
    {
      "topic": "poverty_hrly",
      "alias": "Poverty Wage",
      "description": "The poverty wage is the average annual poverty threshold, used to determine eligibility for specific programs, converted to hourly wages in $2014. The poverty wage should be understood as a yardstick of whether a family is under economic stress, not a measure of basic needs for living expenses. For further detail, please reference the <a href='/assets/Living-User-Guide-and-Technical-Notes-2014.pdf' target='_blank'>technical documentation here.</a>"
    },
    {
      "topic": "minwage_hrly",
      "alias": "Minimum Wage",      
      "description": "The minimum wage is the lowest wage that is legally allowed in the United States, for most types of work.  Reported here is the state minimum wage (average state minimum wage for the US), as of 2014. For further detail, please reference the <a href='/assets/Living-User-Guide-and-Technical-Notes-2014.pdf' target='_blank'>technical documentation here.</a>"
    },
    {
      "topic": "tax",
      "alias": "Taxes",
      "description": "Taxes include estimates for payroll taxes, state income tax, and federal income taxes. Payroll taxes (Social Security and Medicare taxes) were 6.2% of total wages in 2014, as specified in the Federal Insurance Contributions Act. The state tax rate is taken from the second lowest income tax rate for 2011 as reported in the CCH State Tax Handbook. The federal income tax is calculated by the Tax Policy Center of the Urban Institute and Brookings Institution as of 2013. For further detail, please reference the <a href='/assets/Living-User-Guide-and-Technical-Notes-2014.pdf' target='_blank'>technical documentation here.</a>"
    },
    {
      "topic": "adults",
      "alias": "Adults",
      "description": "Adults are members of a household above 18 years of age working full time, year-round 40 hour work weeks. For further detail, please reference the <a href='/assets/Living-User-Guide-and-Technical-Notes-2014.pdf' target='_blank'>technical documentation here.</a>"
    },
    {
      "topic": "children",
      "alias": "Children",
      "description": "Children are those members of the household under 18 years of age. For further detail, please reference the <a href='/assets/Living-User-Guide-and-Technical-Notes-2014.pdf' target='_blank'>technical documentation here.</a>"
    },
    {
      "topic": "occupation",
      "alias": "Occupation Data",
      "description": "The Bureau of Labor Statistics Occupation Employment Statistics Survey reports median wages for 22 major Standard Occupational Coded occupations in all 50 states, as of 2013. For further detail, please reference the <a href='/assets/Living-User-Guide-and-Technical-Notes-2014.pdf' target='_blank'>technical documentation here.</a>"
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
      "alias": "Management"
    },
    {
      "code": "130000",
      "alias": "Business & Financial Operations"
    },
    {
      "code": "150000",
      "alias": "Computer & Mathematical"
    },
    {
      "code": "170000",
      "alias": "Architecture & Engineering"
    },
    {
      "code": "190000",
      "alias": "Life, Physical, & Social Science"
    },
    {
      "code": "210000",
      "alias": "Community & Social Service"
    },
    {
      "code": "230000",
      "alias": "Legal"
    },
    {
      "code": "250000",
      "alias": "Education, Training, & Library"
    },
    {
      "code": "270000",
      "alias": "Arts, Design, Entertainment, Sports, & Media"
    },
    {
      "code": "290000",
      "alias": "Healthcare Practitioners & Technical"
    },
    {
      "code": "310000",
      "alias": "Healthcare Support"
    },
    {
      "code": "330000",
      "alias": "Protective Service"
    },
    {
      "code": "350000",
      "alias": "Food Preparation & Serving Related"
    },
    {
      "code": "370000",
      "alias": "Building & Grounds Cleaning & Maintenance"
    },
    {
      "code": "390000",
      "alias": "Personal Care & Service"
    },
    {
      "code": "410000",
      "alias": "Sales & Related"
    },
    {
      "code": "430000",
      "alias": "Office & Administrative Support"
    },
    {
      "code": "450000",
      "alias": "Farming, Fishing, & Forestry"
    },
    {
      "code": "470000",
      "alias": "Construction & Extraction"
    },
    {
      "code": "490000",
      "alias": "Installation, Maintenance, & Repair"
    },
    {
      "code": "510000",
      "alias": "Production"
    },
    {
      "code": "530000",
      "alias": "Transportation & Material Moving"
    }
  ];

  var dollars = d3.format(",.2f");
  var commas = d3.format(",.0f");
  // A drop-down menu for selecting a state; uses the "menu" namespace.
  dispatch.on("load.menu", function(stateById) {
    var select = d3.select("#donut-chart-menu")
      .append("select")
        .attr("class", "form-control btn-default btn-sm lw-button")
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
      select.property("value", state.familycomposition);
    });
  });

  dispatch.on("load.wages", function(stateById) {

    var margin = {top: 20, right: 0, bottom: 50, left: 10},
        width = parseInt(d3.select("#living-wage-append").style('width'), 10) - margin.left - margin.right,
        height = 300;

    var container = d3.select("#living-wage-append")
          .append("svg")
          .attr("width", width + margin.left + margin.right)
          .attr("height", height + margin.top + margin.bottom);

    var x = d3.scale.ordinal()
        .rangeRoundBands([0, width], .25);

    var y = d3.scale.linear()
        .range([height, 0]);

    var xAxis = d3.svg.axis()
        .scale(x)
        .orient("bottom")
        .tickValues(["Living Wage", "Minimum Wage", "Poverty Wage"]);

    var formatCurrency = d3.format(".1f");


    x.domain(["income_pretax_hrly","minwage_hrly","poverty_hrly"])

    var barChartArea = container.append("g")
          .attr("transform", "translate(" + margin.left + "," + margin.top + ")");

    barChartArea.append("g")
      .attr("class", "x axis")
      .attr("transform", "translate(0," + height + ")")
      .call(xAxis)
    .selectAll(".x.axis text")
      .call(wrap, x.rangeBand())

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
        .attr("height", 0);

    var text = barChartArea.selectAll(".text")  
        .data(x.domain())
      .enter().append("text")
        .attr("class", "bartext")
        .attr("id", function(d) {
          return "text-" + d;
        })
        .attr("text-anchor", "middle")
        .attr("dy", ".35em");

    var printWage = d3.select("#printed-living-wage").append("h5").append("strong").text("0")

    dispatch.on("statechange.wages", function(d) {

        var data = d.wages;
        var max = d3.max(data, function(d) { return parseFloat(d.value); });
        var additionalData = d;

        printWage.transition()
          .duration(300)
          .ease('linear')
          .tween("text", function() {
            var i = d3.interpolate(this.textContent, d.income_pretax_hrly);
            return function(t) {
              this.textContent = "$" + dollars(i(t)) + " / hr.";
            };
          });

        y.domain([0, max]);

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
              var variableText = '</tbody></table>';
              if (d.name == "income_pretax_hrly") {
                variableText = '<tr><td>Hourly wage before taxes (per person):</td><td>$' + (dollars(d.value)).toString() + 
                               '<tr><td>Hourly wage after taxes (per person):</td><td>$' + dollars(additionalData.income_hrly).toString() + '</td></tr>' +
                               '<tr><td>Weekly wage (per person):</td><td>$' + (dollars(d.value * 40)).toString() + '</td></tr>' +
                               '<tr><td>Annual wages (per family):</td><td>$' + (commas(additionalData.income[0].value)) + '</td></tr>' +
                               '</td></tr></tbody></table>';
              }
              var body = '<table id="one-column-emphasis"><colgroup><col class="oce-first"></col></colgroup><tbody>' +
                        variableText
                      + alias[0].description;
              
              return body;
            })
          .transition()
            .attr("y", function(d) { return y(d.value); })
            .attr("height", function(d) { return height - y(d.value); });

        text.data(data)
          .transition()
            .attr("x", function(d, i) { return x(i)+x.rangeBand(d.name)/2; })
            .attr("y", function(d) { return y(d.value/2); })
            .text(function (d) { return "$" + dollars(d.value) });


        function type(d) {
          d.value = +d.value; // coerce to number
          return d;
        }

    });
  });

  if (gon.census_type !== "county" && gon.census_id !== 31700 && gon.census_id !== 39300){
      dispatch.on("load.occupations", function(stateById) {
  
        var margin = {top: 15, right: 15, bottom: 55, left: 350},
            width = parseInt(d3.select("#occupations-bar-graph").style('width'), 10) - margin.left - margin.right,
            height = 520 - margin.top - margin.bottom;
  
        var data = gon.occupations;
        var highest_salary = d3.max(gon.occupations, function(d) { return d.occ_salary; });
        var occupations = data.map(function(d) { return d.occ_type; });
  
        var chart = d3.select("#occupations-bar-graph")
            .append("svg")
            .attr("width", width + margin.left + margin.right)
            .attr("height", height + margin.top + margin.bottom);
  
        var chartArea = chart.append("g")
            .attr("transform", "translate(" + margin.left + "," + margin.top + ")")
  
        var x = d3.scale.linear()
          .range([0, width])
          .domain([0, highest_salary]);
  
        var y = d3.scale.ordinal()
          .domain(occupations)
          .rangeRoundBands([0, height]);
  
        var bar = chartArea.selectAll("g")
          .data(data).enter()
          .append("g")
          .attr("transform", function(d) {
            return "translate(" + 0 + "," +  y(d.occ_type) + ")"
          })
  
        var livingWageLabel = chartArea.append("g")
              .attr("transform", "translate(" + x(0) + "," + (height + 33) + ")");
  
        livingWageLabel.append("text")
              .style("text-anchor", "beginning")
              .style("fill", "black")
              .attr("id", "occupations-living-wage-label")
              .attr("x", 0)
              .attr("y", -height-20)
              .attr("dy", "1em")
              .text("Jobs that pay the Living Wage")
              .call(wrap, 120);
  
        var livingWageSalary = livingWageLabel.append("text")
              .style("text-anchor", "beginning")
              .style("fill", "black")
              .attr("id", "occupations-living-salary")
              .attr("x", 5)
              .attr("y", 0)
  
        var xAxis = d3.svg.axis()
            .scale(x)
            .orient("bottom")
            .tickFormat(function(d) { return "$" + commas(d); })
            .ticks(2);
  
        chartArea.append("g")
            .attr("class", "y axis")
            .attr("transform", "translate(0," + height + ")")
            .call(xAxis)
  
        // var livingLabel = chartArea.append("text").attr("x", -5).attr("y",0).style("text-anchor", "end").text("Living Wage ▼");
        var line = chartArea.append("svg:line")
          .attr("x1", 0)
          .attr("y1", 0)
          .attr("x2", 0)
          .attr("y2", height + 35)
          .style("stroke", "black")
          .style("stroke-width", 2)
          .style("stroke-opacity", 0.15)
  
        bar.append("rect")
            .style("fill", "#4682B4")
            .style("stroke", "white")
            .style("stroke-width", 2)
            .style("opacity", 0.9)
            .attr("class", "occupation")
            .attr("height", y.rangeBand())
            .attr("width", 0);
  
        bar.append("text")
            .attr("y", y.rangeBand()-5)
            .attr("x", -5)
            .attr("text-anchor", "end")
            .style("cursor", "default")
            .style("opacity", 0.8)
            .on("mouseover", function() {
              d3.select(this).style("opacity", 1)
            })
            .on("mouseout", function() {
              d3.select(this).style("opacity", 0.8)
            })
            .text(function(d) {
              var alias = occupation_aliases.filter(function(m) {
                return ("occ_" + m.code) == d.occ_type;
              });
              return alias[0].alias;
            });
  
        bar.append("text")
            .attr("y", y.rangeBand()-5)
            .attr("x", 5)
            .attr("text-anchor", "beginning")
            .style("fill","#ffffff")
            .style("shape-rendering", "crispEdges")
            .text(function(d) {
              return "$" + commas(d.occ_salary.toFixed(0));
            });
  
        dispatch.on("statechange.occupations", function(d) {
  
          var living_salary = d.income[0].value;
          var living_occupations = [];
  
          livingWageLabel.transition()
            .attr("transform", "translate(" + (x(living_salary) + 5) + "," + (height + 33) + ")");
  
          livingWageSalary.text("$" + commas(living_salary));
  
          line.transition()
              .attr("x1", function(d) { return x(living_salary); })
              .attr("x2", function(d) { return x(living_salary); })
              .attr("y1", 0)
              .attr("y2", height + 35);
  
          bar.selectAll("rect").transition().style("opacity", function(d) {
                if (living_salary < d.occ_salary) {
                  living_occupations.push(d.occ_type);
                  return 0.9;
                } else {
                  
                  return 0.6;
                }
              })
              .attr("width", function(d) {
                return x(d.occ_salary)
              });
  
          // livingLabel.transition().attr("y", y(living_occupations[0]));
  
        });
      });
  }

  dispatch.on("load.pie", function(stateById) {

    var width = parseInt(d3.select("#living-wage-append").style('height'), 10),
        height = width-30,
        radius = height / 2,
        labelr = radius + 15;

    var color = d3.scale.ordinal()
        .domain(groups)
        // .range(["#a65628","#377eb8","#e41a1c","#4daf4a","#ff7f00","#984ea3", "#666666"])
        .range(["#4682B4"]);

    var arc = d3.svg.arc()
        .outerRadius(radius - 10)
        .innerRadius(radius - 130);

    var pie = d3.layout.pie()
        .sort(null);

    var pieChartArea = d3.select("#living-wage-pie").append("svg")
        .attr("width", width)
        .attr("height", height)
      .append("g")
        .attr("transform", "translate(" + (width / 2) + "," + height / 2 + ")")

    var path = pieChartArea.selectAll("path")
        .data(groups)
      .enter().append("path")
        .style("fill", color)
        .style("opacity", function(d,i) {
          return (i + 5) * 0.1;
        })
        .style("stroke", "white")
        .style("stroke-width", 2)
        .each(function() { this._current = {startAngle: 0, endAngle: 0}; })

    var labels = pieChartArea.selectAll("text")
        .data(groups)
      .enter().append("text")
        .attr("transform", "translate(0,0)")
        .attr("class", "pie-text");

    var categories = pieChartArea.selectAll(".categories text")
        .data(groups)
      .enter().append("svg:text")
        .attr("transform", "translate(0,0)")
        .attr("class", "categories")

    dispatch.on("statechange.pie", function(d) {

      var sum = 0;
      d.contributions.forEach(function(d) {
        sum = sum + parseInt(d.value);
      });

      path.data(pie.value(function(g) { return d[g]; })(groups))
          .attr("data-title", function(d) {
              var alias = descriptions.filter(function(m) {
                return m.topic == d.data;
              });
              return alias[0].alias; 
            })
          .attr("data-content", function(d) { 
            var alias = descriptions.filter(function(m) {
              return m.topic == d.data;
            });
            var body = alias[0].description;
            return body;
          })
          .transition()
          .attrTween("d", function(d) {
            var interpolate = d3.interpolate(this._current, d);
            this._current = interpolate(0);
            return function(t) {
              return arc(interpolate(t));
            };
          });

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
                return (d.value/sum * 100).toFixed(1) + "%"; 
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

    for(var prop in d){
      pluck.push({ name: prop, value: d[prop] })
    }; 

    contributions = pluck.filter(function(d) { return d.name !== "familycomposition" && d.name !== "minwage_hrly" && d.name !== "income_pretax_hrly" && d.name !== "poverty_hrly" && d.name !== "income" });

    wages = pluck.filter(function(d) { return d.name == "minwage_hrly" || d.name == "income_pretax_hrly" || d.name == "poverty_hrly"  });

    var income = pluck.filter(function(d) { return d.name == "income"; })

    d.contributions = contributions;
    d.wages = wages;
    d.income = income;

    stateById.set(d.familycomposition, d); 
  });

  dispatch.load(stateById);
  dispatch.statechange(stateById.get("2A2C"));

  var format = d3.format(",.2f");
  var pct = d3.format("4%");

  var margin = {top: 1, left: 1, bottom: 20, right: 1}, 
    width = parseInt(d3.select('#choropleth-map').style('width')) - margin.left - margin.right, 
    mapRatio = .5, 
    height = width * mapRatio,
    active = false;

  var projection = d3.geo.albersUsa()
      .scale(width)
      .translate([(width / 2 ) + 20, height / 2]);

  var path = d3.geo.path()
      .projection(projection);

  var svg = d3.select("#choropleth-map").append("svg")
      .attr("width", width)
      .attr("height", height);

  svg.append("rect")
      .attr("width", width)
      .attr("height", height);

  var g = svg.append("g");

  var quartileScale = d3.scale.quantize()
        .domain([0,.5])
        .range(["#f1eef6","#bdc9e1","#74a9cf","#0570b0"]);

  var legend = g.selectAll('rect')
      .data(["#9ecae1","#6baed6","#3182bd","#08519c"])
      .enter()
      .append('rect')
      .attr("x", 0)
      .attr("y", function(d, i) {
        return (i * 20)+30;
      })
      .attr("width", 10)
      .attr("height", 10)
      .style("fill", function(d) {
        return d;
      });

  g.append('text')
      .attr("x", 15)
      .attr("y", 40)
      .text("Lowest Share")

  g.append('text')
      .attr("x", 15)
      .attr("y", 98)
      .text("Highest Share")

  d3.json("../assets/us.js", function(error, us) {

    g.selectAll("path")
        .data(topojson.feature(us, us.objects.states).features)
      .enter().append("path")
        .attr("d", path)
        .attr("class", "feature")
        .style("fill", function(d) {
          var parsed = parseFloat(d.properties.Share_BelowLW_State1_share_BelowLW);
          if(parsed < 0.307605) {
            return "#9ecae1";
          } 

          if(parsed > 0.307606 && parsed < 0.332683) {
            return "#6baed6";
          } 

          if(parsed >= 0.332683 && parsed < 0.355403) {
            return "#3182bd";
          } 

          if(parsed >= 0.355403) {
            return "#08519c";
          } 
        })
        .attr("data-title", function(d) {
          return d.properties.StateShareHH_SubLW_state;
        })
        .attr("data-content", function(d) {
          var variableText = '<table id="one-column-emphasis"><colgroup><col class="oce-first"></col></colgroup><tbody>' +
                              '<tr><td>National share:</td><td> 37.3% ' + 
                               '<tr><td>State Share:</td><td>' + (d.properties.Share_BelowLW_State1_share_BelowLW*100).toFixed(1) + '%</td></tr>' +
                               '<tr><td>State Rank:</td><td>' + d.properties.Share_BelowLW_State1_rank + '</td></tr>' +
                               '</td></tr></tbody></table>';
          return variableText;
        });

      g.append("path")
          .datum(topojson.mesh(us, us.objects.states, function(a, b) { return a !== b; }))
          .attr("class", "mesh")
          .attr("d", path);

      $(".feature").each( function() {
        $(this).popover({
            'container': '#national-landscape', 
            'trigger': 'manual',
            'html': true,
            'placement': 'auto bottom'
        })
        .on("mouseenter", function() {
          var _this = this;
          $(this).popover("show");
          $(".popover").on("mouseleave", function () {
              $(_this).popover('hide');
          });
        })
        .on("mouseleave", function () {
          var _this = this;
          setTimeout(function () {
              if (!$(".popover:hover").length) {
                  $(_this).popover("hide")
              }
        }, 100);
        });
      });

    });

    function wrap(text, width) {
      text.each(function() {
        var text = d3.select(this),
            words = text.text().split(/\s+/).reverse(),
            word,
            line = [],
            lineNumber = 0,
            lineHeight = 1.1, // ems
            y = text.attr("y"),
            dy = parseFloat(text.attr("dy")),
            tspan = text.text(null).append("tspan").attr("x", 0).attr("y", y).attr("dy", dy + "em");
        while (word = words.pop()) {
          line.push(word);
          tspan.text(line.join(" "));
          if (tspan.node().getComputedTextLength() > width) {
            line.pop();
            tspan.text(line.join(" "));
            line = [word];
            tspan = text.append("tspan").attr("x", 0).attr("y", y).attr("dy", ++lineNumber * lineHeight + dy + "em").text(word);
          }
        }
      });
    }


    $("svg rect").each( function() {
      $(this).popover({
          'container': '#living-wage-section', 
          'trigger': 'manual',
          'html': true,
          'placement': 'auto bottom'
      })
      .on("mouseenter", function() {
        var _this = this;
        $(this).popover("show");
        $(".popover").on("mouseleave", function () {
            $(_this).popover('hide');
        });
      })
      .on("mouseleave", function () {
        var _this = this;
        setTimeout(function () {
            if (!$(".popover:hover").length) {
                $(_this).popover("hide")
            }
      }, 100);
      });
    })

    $("svg path").each( function() {
      $(this).popover({
          'container': '#living-wage-section', 
          'trigger': 'manual',
          'html': true,
          'placement': 'auto bottom'
      })
      .on("mouseenter", function() {
        var _this = this;
        $(this).popover("show");
        $(".popover").on("mouseleave", function () {
            $(_this).popover('hide');
        });
      })
      .on("mouseleave", function () {
        var _this = this;
        setTimeout(function () {
            if (!$(".popover:hover").length) {
                $(_this).popover("hide")
            }
      }, 100);
      });
    })

    $('.social').prettySocial();

});
