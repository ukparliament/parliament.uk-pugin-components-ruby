require 'spec_helper'

describe Pugin::Feature::SimpleFeature do

    before :example do 
        Pugin::Feature::SimpleFeature.disable
    end

    after :example do
        Pugin::Feature::SimpleFeature.disable
    end

    it_behaves_like 'a simple pugin feature'

    context 'when enabling a subclass' do
      it 'only enables that sub class' do
        expect(Pugin::Feature::SimpleFeature.enabled?).to equal(false)

        expect(Pugin::Feature::SimpleFeature.enabled?).to equal(false)

        Pugin::Feature::SimpleFeature.enable
        expect(Pugin::Feature::SimpleFeature.enabled?).to equal(true)

        Pugin::Feature::SimpleFeature.disable
        expect(Pugin::Feature::SimpleFeature.enabled?).to equal(false)
      end
    end
end
