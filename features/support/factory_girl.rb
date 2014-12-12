# Allow direct use of .build and .create rather than having to say
# FactoryGirl.build and FactoryGirl.create. This will include the
# module into the object that Cucumber step definitions run within.
World(FactoryGirl::Syntax::Methods)
