require('spec_helper')

describe(Train) do
  describe('#line') do
    it('returns the line of an instance of train') do
      test_train = Train.new(:line => "Blue", :id => nil)
      expect(test_train.line()).to(eq("Blue"))
    end
  end

  describe('.all') do
    it('returns an array of saved instances of Train, it is empty at first') do
      expect(Train.all()).to(eq([]))
    end
  end

  describe('#save') do
    it('pushes an instance of Train into an array of saved Train insrances') do
      test_train = Train.new(:line => "Yellow", :id => nil)
      test_train.save()
      expect(Train.all()).to(eq([test_train]))
    end
  end

  describe('#==') do
    it('evaluates two instances of Train as equal if they have the same line') do
      test_train = Train.new(:line => "Blue", :id => nil)
      test_train2 = Train.new(:line => "Blue", :id => nil)
      expect(test_train).to(eq(test_train2))
    end
  end

  describe('id') do
    it('returns an id number for an istance of train') do
      test_train = Train.new(:line => "Black", :id => nil)
      test_train.save()
      expect(test_train.id()).to(be_an_instance_of(Fixnum))
    end
  end

  describe('.find') do
    it("returns an instance of Train by it's id") do
      test_train = Train.new(:line => "Black", :id => nil)
      test_train.save()
      test_train2 = Train.new(:line => "Blue", :id => nil)
      test_train2.save()
      expect(Train.find(test_train.id)).to(eq(test_train))
    end
  end

  describe('#delete') do
    it('removes an instance of Trani from the arrray of saved instances') do
      test_train = Train.new(:line => "Blue", :id => nil)
      test_train.save()
      test_train2 = Train.new(:line => "Black", :id => nil)
      test_train2.save()
      test_train.delete()
      expect(Train.all()).to(eq([test_train2]))
    end
  end
end
