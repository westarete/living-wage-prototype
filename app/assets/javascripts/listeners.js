
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
    "other_cost"
  ];

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
    },

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

  var color = d3.scale.ordinal()
      .domain(groups)
      .range(["#e41a1c","#377eb8","#4daf4a","#984ea3","#ff7f00","#ffff33"]);

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
       $("#living-wage-append").empty();
       $("#other-wages-append").empty();
      select.property("value", state.familycomposition);


    });
  });

  dispatch.on("load.wages", function(stateById) {

      var margin = {top: 20, right: 10, bottom: 30, left: 10},
          width = parseInt(d3.select("#living-wage-append").style('width'), 10) - margin.left - margin.right,
          height = 200 - margin.top - margin.bottom;

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
          .ticks(5)
          .tickFormat(function(d) { return "$" + formatCurrency(d); });

      var barHeights = 0



    dispatch.on("statechange.wages", function(d) {

      var svg = d3.select("#living-wage-append")
        .append("svg")
          .attr("width", width + margin.left + margin.right)
          .attr("height", height + margin.top + margin.bottom)
        .append("g")
          .attr("transform", "translate(" + margin.left + "," + margin.top + ")");

        var data = d.wages;

        console.log(data);

        x.domain(data.map(function(d) { return d.name; }));
        y.domain([0, d3.max(data, function(d) { return d.value; })]);

        svg.append("g")
            .attr("class", "x axis")
            .attr("transform", "translate(0," + height + ")")
            .call(xAxis);

        svg.selectAll(".bar")
            .data(data)
          .enter().append("rect")
            .attr("class", "bar")
            .attr("id", function(d) {
              return "bar-" + d.name;
            })
            .attr("x", function(d) { return x(d.name); })
            .attr("y", function() { return y(0); })
            .attr("width", x.rangeBand())
            .attr("height", 0)
          .transition()
            .attr("y", function(d) { return y(d.value); })
            .attr("height", function(d) { return height - y(d.value); });

        svg.selectAll(".text")
            .data(data)
          .enter().append("text")
            .attr("class", "bartext")
            .attr("id", function(d) {
              return "text-" + d.name;
            })
            .attr("text-anchor", "middle")
            .attr("x", function(d, i) { return x(i)+x.rangeBand(d.name)/2; })
            .attr("y", function(d) { return y(d.value/2); })
            .attr("dy", ".35em")
            .text(function (d) { return "$" + d.value });


        function type(d) {
          d.value = +d.value; // coerce to number
          return d;
        }

    });
  });

  dispatch.on("load.occupations", function(stateById) {

    var div = d3.select('#occupations-data tbody');

    dispatch.on("statechange.occupations", function(d) {
      var living_salary = d.income[0].value;
      var types = div.selectAll("td")
          .data(gon.occupations)
          .enter()
            .append("tr")
            .attr("class", "body");

        types
          .append("td")
          .text(function(d) { 
            var alias = occupation_aliases.filter(function(m) {
              return "occ_" + m.code == d.occ_type;
            });

            return alias[0].alias; 
          });

        types
          .append("td")
          .text(function(d) { return "$" + dollars(d.occ_salary); });

      d3.selectAll("#occupations-data tbody tr.body").style("background-color", function(d) {
          if (living_salary < d.occ_salary) {
            return "#dff0d8";
          } else {
            return "#f2dede";
          }
      });


    });
  });

  // A pie chart to show population by age group; uses the "pie" namespace.
  dispatch.on("load.pie", function(stateById) {

    var width = parseInt(d3.select("#donutchart").style('width'), 10)*0.6,
        height = width,
        radius = Math.min(width, height) / 2,
        labelr = radius + 15;

    var arc = d3.svg.arc()
        .outerRadius(radius - 20)
        .innerRadius(radius - 125);

    var pie = d3.layout.pie()
        .sort(null);

    var svg = d3.select("#donutchart").append("svg")
        .attr("width", width + 20)
        .attr("height", height + 20)
      .append("g")
        .attr("transform", "translate(" + width / 2 + "," + height / 2 + ")");

    var path = svg.selectAll("path")
        .data(groups)
      .enter().append("path")
        .style("fill", color)
        .each(function() { this._current = {startAngle: 0, endAngle: 0}; })

    var text = svg.selectAll("text")
        .data(groups)
      .enter().append("svg:text")
        .attr("transform", "translate(0,0)")

    dispatch.on("statechange.pie", function(d) {

      var sum = 0;

      d.contributions.forEach(function(d) {
        sum = sum + d.value;
      });

      console.log(sum);

      path.data(pie.value(function(g) { return d[g]; })(groups))
          .transition()
          .attrTween("d", function(d) {
            var interpolate = d3.interpolate(this._current, d);
            this._current = interpolate(0);
            return function(t) {
              return arc(interpolate(t));
            };
          });

      path.attr("data-title", function(d) { return d.data; })
        .attr("data-content", function(d) { return d.value; })

      text.data(pie.value(function(g) { return d[g]; })(groups))
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
          .attr("class", "pie-text")
          .text(function(d, i) { 
            var alias = contribution_aliases.filter(function(m) {
              return m.type == d.data;
            });

            if (d.value !== 0) 
              { 
                return alias[0].alias + ": " + (d.value/sum * 100).toFixed(2) + "%"; 
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


  // Bootstrap & other UI 

  $(".data-panel").popover({
      'container': 'body',
      'placement': 'bottom',
      'trigger': 'hover',
      'html': true
  });

  $("path").popover({
      'container': 'body',
      'placement': 'right',
      'trigger': 'hover',
      'html': true
  });

  $("#sticky-menu").stick_in_parent({offset_top: 51});

});
