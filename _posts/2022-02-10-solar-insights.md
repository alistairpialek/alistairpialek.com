---
layout: post
title: "Insights into boosting your solar power self-consumption"
date: 2022-03-01 09:00:00 +1100
tags: solar
---

Posted 10 February, 2022.

<img src="assets/images/solar-panels.jpeg" alt="Pipes" width="600"/>

As a lucky home owner in Sydney, I have been fortunate enough to be able to install solar panels and ducted air
conditioning in my house. We have had solar panels going on 3 years now so I thought I would share some insights into
how we use our solar power in 2022.

##### The panels themselves

We have a 5.4kW system that comprises of 18 300W [Canadian Solar][2] panels and a 5.1kW [SolarEdge][3] inverter. Each panel has a
[Power Optimiser][6] which means that they can be individually monitored and can tolerate shading without dropping the
total array output to the weakest producing panel. The panels are Northeast facing with no shading so we tend to get a
very nice production curve when the sun is out.

Why did we bother getting Power Optimisers then if shading isn't an issue? Well, the main reason (and at the time we
honestly knew very little about how the panels would work or what energy they were going to produce) was for the
individual panel monitoring that is available to us via the SolarEdge site and API. Solar panels are installed and up on
roofs for about 10 years (most warranties cover panels for about this period of time), but after a certain point in time,
certain panels might fail or start to noticeably degrade. They might even get damaged from hail or wiring might suffer
UV damage well before this time.

So how would you know that one of your solar panels was damaged if you couldn't monitor it? Your best bet would be
noticing a drop in total production. But given weather and seasonality also impacts production, you might just not notice.

We don't check each individual panels each day (although I do have Datadog graphs for each panels daily production).
But it's fantastic to have this data and the ability to troubleshoot which of my 18 solar panels might be acting up when
the time arises.

<img src="assets/images/panel-energy.png" alt="Panel Monitoring" width="400"/>

**Above: Datadog is a great tool to create dashboard's for your home automation needs. With this graph I can easily spot a panel performing abnormally.**

##### Solar inverter

Working with the [SolarEdge SE5000H][4] single phase inverter has been an absolute pleasure and I would buy one again
without hesitation. Being a data nerd, one of the things the inverter needed to have was an API. I wanted to be able to
pull out solar data and slice and dice the info in Google Sheets or whatever script I created to answer questions.
And if you're paying good money for the inverter anyway, why would you pay for anything less?

The [API][1] is great to use and easy enough to understand (url params with json output). Just make sure you learn the
difference between power and energy and know what you're after, as the API has these distinctly separated and sometimes
you will find yourself swimming around endpoints getting confused. The only issue I have with it is the daily API
call limit of 300 requests. That gets annoying particularly when you are trying to graph power rather than energy,
which makes most sense to be somewhat realtime. In another situation, I wanted to graph the temperature of my inverter
to see how hot it was getting which again needs to be done at 5-15min intervals to keep under the daily API call limit.
In my scripts I had to factor this in. Not a big deal, and I understand why the limit is there.

As for inverter performance, it's been flawless and I've spent next to no-time having to troubleshoot it or connect it
back up to WiFi etc. It just chugs along day-in day-out.

##### How we use our solar power

One of the trends we have noticed over the years is the reduction in solar feed-in tariffs. Very early on, as solar
started to kick off in Australia, feed-in tariffs were sky high and it made a lot of sense to feed-back into the grid
any excess solar power you created. More specifically, one might have chose to not self-consume their solar power in
favour of feeding it back into the grid.

Fast forward to 2022, and only just recently did we change energy plans with an energy provider to receive an amazing
feed-in rate of 5c per kilowatt. When electricity is purchased for about 20c, it becomes abundantly clear that the best
way to to use your solar and increase your solar system ROI is just to self-consume the power you produce.
If nothing else, this is perhaps the best way to avoid curtailment (which is when grid operators, in protecting the grid,
choose to turn off household solar exports) which is an ongoing discussion at the moment. Sidebar: How they plan to
achieve this when my inverter doesn't have a magic killswitch (that I am aware of) is beyond me…

Self-consuming our solar power meant that we used our appliances differently. Rather than putting the dishwasher on at
night, we put it on after breakfast when the sun is out. The dryer tends to run during the day (and it runs a lot with a
1 year old in the house) etc.

We also chose to put our 5kW single-element hot water system on off-peak (Controlled Load 1) so that it doesn't come on
during the day which is something coincidentally we were able to discern by monitoring the SolarEdge app. That thing that
spikes energy consumption to 5kw 8 times a day is likely your hot water topping off. Truthfully, switching it to off-peak
hasn't saved us a whole bunch of money... There's a couple of things to understand. Firstly, because energy providers
are awesome, you will pay an additional daily supply charge of ~5c for the off-peak tariff in addition to the daily
supply charge you pay for your general usage tariff. So now you pay two daily supply charges. Second, the Controlled Load
tariffs have steadily increased over the years. It's still roughly half the price of the general usage tariff, but it's
increasing and used to be much cheaper. After crunching the numbers, for us, we save about $5 per month having switched
our hot water over to off-peak. But considering we needed to pay a $250 connection charge to do so, it will take us 50
months to see any savings from it. So that was a fun adventure.

The other reason why we chose to put the hot water on off-peak, was to "clear the slate" for our [Daikin RZA100CV1][5] to run during
the day. At peak, it uses about 4kW cooling the house and on a good day, our solar production can easily cover this
producing 4-5kW on a clear day. A 30 degree day for us, with clear skies and the A/C running will see us feed-in about
10kW (not that we're counting it) and produce about 25-35kW. We self-consume most of what we produce, but will still need
to purchase about 20kW. The afternoons are when we tend to purchase the most as the sun is starting to set, but the house
(a brick vaneer with no insulation in the walls, not ideal…) is still baking and needing to be cooled.

<img src="assets/images/solar-production.jpg" alt="Solar Production Curve" width="400"/>

**Above: You can see the afternoon "purchasing tail" (red shading).**

The 5kW surge at middnight is our 5kW
hot water system kicking in. The surges during the day are from the ducted A/C kicking in and cooling the house. So you
can see the SolarEdge app is very handy for discovering how you use your energy.

Our hot water and ducted air conditioning account for about 70% of our daily energy usage so I'd encourage anyone looking to reduce their energy bill to identify what your main energy consumers are and work on ways to make your solar production cover these consumption costs. It's tempting to run around the house turning off lights and switching to LED bulbs and whilst still valuable, for us at least, only accounts for 1-2% of our daily energy usage.

[1]: https://www.solaredge.com/sites/default/files/se_monitoring_api.pdf
[2]: https://www.canadiansolar.com/
[3]: https://www.solaredge.com/
[4]: https://www.solaredge.com/sites/default/files/se-single-phase-HD-wave-inverter-datasheet-aus.pdf
[5]: https://www.daikin.com.au/our-product-range/ducted-system-air-conditioning/inverter-ducted
[6]: https://www.solaredge.com/aus/products/power-optimizers#/
