# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Page, type: :model do
  subject do
    Page.new(
      title: 'some title', slug: 'a-slug',
      body: 'the rain in spain falls mainly on the plain',
      meta_description: 'meta info about this page'
    )
  end

  it 'is valid with valid attributes' do
    expect(subject).to be_valid
  end

  it 'is invalid without a title' do
    subject.title = nil

    expect(subject.valid?).to be false
    expect(subject.errors[:title]).to include("can't be blank")
  end

  it 'is invalid without a slug' do
    subject.slug = nil

    expect(subject.valid?).to be false
    expect(subject.errors[:slug]).to include("can't be blank")
  end

  it 'is invalid with duplicate slugs' do
    subject.save
    duplicate = subject.dup
    duplicate.body = 'some body'

    expect(duplicate.valid?).to be false
    expect(duplicate.errors[:slug]).to include('has already been taken')
  end

  it 'is invalid without a body' do
    subject.body = nil

    expect(subject.valid?).to be false
    expect(subject.errors[:body]).to include("can't be blank")
  end
end
