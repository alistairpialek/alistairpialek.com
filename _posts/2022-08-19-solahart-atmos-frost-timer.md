---
layout: post
title: "Solahart Atmos Frost Timer Function"
date: 2022-08-19 09:00:00 +1100
tags: hot-water
---

Posted 19 August, 2022.

<img src="assets/images/pipes.jpeg" alt="Pipes" width="600"/>

Recently we made the switch to the [Solahart Atmos Frost][1] heat pump and we've been very impressed with how its performed so far.
We did however have some trouble getting the timer function to work with our off peak tariff. Here's how we solved it.

##### The problem and why we wanted to use a timer

Controlled load 1 runs for us from 12:30am to 7:00am during the week. During the weekend it runs from 12:30am to 5:00pm.
During the week, water is heated for a few hours starting from when power is turned on at 12:30am. During the weekend the
timing get's a little out of schedule. On Sunday morning, water is heated as per normal but will additionally be heated
around 3:00pm as well. This is largely because we use more hot water over the weekend for showers and running the washing machine.
When water is heated at 3:00pm, it then does not need to be heated at 12:30am Monday night, which means it doesn't get heated
until Tuesday night stretching the 270L tank to ~35 hours between reheats. It's very noticeable when this happens and water
coming out of the tap is barely tolerable for showers.

My attempts to set a timer (timer 1) on the unit to make sure it would only run from 12:30am to 7:00am were unsuccessful.
Even though the time was set, the unit would still turn on at 3:00pm!

##### The fix

The [manual][2] firstly makes it very unclear whether the timer is a blockout timer or not. Most hot water systems work using
a blockout timer, so this was my assumption. When setting the timer as a blockout timer failed to work, I proceeded to set the
timer as a normal timer. This also failed, with the unit just turning on anyway.

A tiny reference in the manual gave me a hint towards what the problem might have been:

> *It is necessary though to turn the heat pump "Off" at the Display Panel to complete or activate particular user function settings.*

I actually didn't realise that the heat pump could be turned "Off" by just pressing the power button while the unit has power.
As it turns out, when the unit is "On" it is in an "interactive" mode and if water needs to be heated, it will heat it,
regardless of any timers you might have set. It's when the unit is "Off" that is then turns "On" using any timers you might have set.

Knowing this, we then did the following:

1. Set timer 1 on @ 1:00am and off @ 6:30am. We didn't need timer 2 to be set. This will need to be done when the unit next has power.
2. Turn the unit "Off". This is really important. The timer will not work if the unit is "On". We could have set the timer
on for 12:30am as well, that would also work.
3. Make sure the timer off time is BEFORE the unit loses power hence why we set it to 6:30am, half an hour before the power is
turned off at 7:00am. The reason for this is that when unit loses power, it remembers the "On"/"Off" state it was previously set to
when it turns back on. The unit needs to turn back on in the "Off" state so that the timer can function. If you don't set
the timer off before the system loses power, it will turn back on in the "On" state which will not use the timer.

And that's it! Not complicated at all!

[1]: https://www.solahart.com.au/products/heat-pump/atmos-frost-270/
[2]: https://www.solahart.com.au/media/8190/install-instruct-solahart-heat-pump-270hav-126441-rev-a-2021-june.pdf
