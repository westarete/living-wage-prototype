# for more details see: http://emberjs.com/guides/models/defining-models/

Lwc.Aggregation = DS.Model.extend
  explainable_id: DS.attr(),
  explainable_type: DS.attr(),
  familycomposition: DS.attr(),
  familysize: DS.attr(),
  house_cost: DS.attr(),
  childcare_cost: DS.attr(),
  health_cost: DS.attr(),
  food_cost: DS.attr(),
  trans_cost: DS.attr(),
  other_cost: DS.attr(),
  income: DS.attr(),
  income_pretax: DS.attr(),
  tax: DS.attr(),
  poverty: DS.attr(),
  minwage_hrly: DS.attr(),
  minwage: DS.attr(),
  income_hrly: DS.attr(),
  income_pretax_hrly: DS.attr()

