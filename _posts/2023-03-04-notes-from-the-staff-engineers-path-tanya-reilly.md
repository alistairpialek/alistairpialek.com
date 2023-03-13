---
layout: post
title: "Notes from The Staff Engineer's Path - Tanya Reilly"
date: 2023-03-04 09:00:00 +1000
tags: book, staff-engineer
---

Where _Staff Engineer_ (Will Larson) focuses on what a staff+ engineer _is_, _The Staff Engineer's Path_ (Tanya Reilly)
as an accompaniment book focuses on what a staff+ engineer _does_. Written in three parts "The Big Picture", "Execution"
and "Leveling Up" _The Staff Engineer's Path_ is a must read for anyone looking to pursue a staff+ career path or for
existing staff+ engineers wanting to refine their craft.

# Part I - Big Picture Thinking

## Chapter 1 - What Would You Say You Do Here?

- The _local maximum_, the best decision for a single group, might not be anything like the best decision when you
  take a broader view.
- When early-career engineers respect someone as the kind of engineer they want to "grow up" to be, that's a powerful
  motivator to act like they do.
- If your reporting to someone low in the org hierarchy, make sure to have skip-level meetings with your manager's
  manager. Find ways to say connected with your organization's goals.
- When a senior person devotes themselves to the sort of coding project that any midlevel engineer could have taken on:
  you're going to do a stella job on it, but chances are there's a senior-sized problem available that any midlevel
  engineer wouldn't be able to tackle.

## Chapter 2 - Three Maps

- Three maps: A locator map: you are here, a topographical map: learning the terrain and a treasure map: x marks the spot.
- Your locator map can help you make sure the teams you work with really understand their purpose in the organization, who
  their customers are, and how their work affects other people.
- Your topological map can help highlight the friction and gaps between teams and open up the paths of communication.
- Your treasure map can help you make sure everyone knows exactly what they're trying to achieve and why.
- If you can't explain why what you're doing needs a staff engineer, you might be doing the wrong thing.
- "Nines don't matter when users aren't happy." - Charity Majors, CTO of Honeycomb
- Think about how these seven attributes influence how your organization works. If you're trying to cause a culture
  change, it's often possible - with determined effort - to nudge the sliders in one direction or the other over time.
  At least know where they are, and you'll avoid some of the pitfalls of working against prevailing culture.

```
Secret        |-------0-------| Open
Oral          |----0----------| Written
Top-down      |-----------0---| Bottom-up
Fast          |--0------------| Deliberate
Back channels |------0--------| Front doors
Allocated     |--0------------| Available
Liquid        |---------0-----| Crystallized
```

- Looking at the full list of Slack channels sorted by most recently created so you can see what new projects are happening.

## Chapter 3 - Creating the Big Picture

- Think big. If you set a goal of 20-minute deploys, the teams pushing toward the goal have an incentive to have bigger
  braver ideas. Maybe they'll contemplate replacing the CI/CD system, or discarding a test framework that can never be
  compatible with that goal. Inspire people to get creative.
- What will future you wish that present you had done?
- Don't block on full consensus: you might be waiting forever. Take a tactic from the IETF of "rough consensus" where
  it is posited that "lack of disagreement is more important than agreement." In other words, take the sense of the group,
  but don't insist that everyone must perfectly agree. Rather than asking, "Is everyone Ok with choice A?" ask,
  "Can anyone not live with choice A?"
- Moving forward is more important than one person's argument carrying the day.

### Industry Perspective

```
- LeadDev - https://leaddev.com/events
- Rands Leadership Slack - https://randsinrepose.com/welcome-to-rands-leadership-slack/
- InfoQ Software Architects Newsletter - https://www.infoq.com/software-architects-newsletter/
- VOID Report - https://www.verica.io/blog/announcing-the-void/
- SRE Weekly - https://sreweekly.com/
- Raw Signal newsletter - https://www.rawsignal.ca/newsletter
- Thoughtworks Radar - https://www.thoughtworks.com/radar
```

# Part II - Execution

## Chapter 4 - Finite time

- Working with someone who's great at a skill you want can take you up a level in a way that's hard to find elsewhere.
- What it it's the wrong project for you? You can make the project into an opportunity for someone else.
- Defend your time. "You don't get to that level without knowing how to defend your time."

## Chapter 5 - Leading Big Projects

- "If I had asked people what they wanted, the would have said faster horses." - Henry Ford
- If you're the project lead, you are ultimately responsible for the project. That means you're implicitly filling any
  roles that don't already have someone in them, or at least making sure the work get done. If your teammates have no
  manager, you're going to be helping them grow. If there's tracking user requirements, that's you. If nobody is
  project managing, that's you as well.
- Estimating time - Break the work up into the smallest tasks you can, since those are easiest to estimate.
- RFC - Wrong is better than vague - It's a better use of your time to be wrong or controversial that it is to be vague.
  If you're wrong, people will tell you and you'll learn something, and you can change direction if you need to.
- It's fine to use a few extra words or even repeat yourself if it means avoiding ambiguity. Instead of saying "this" or
  "that", you should add a noun to spell out exactly what you're referring to, even if you've just mentioned it.
- "Writing code is rarely the highest leverage thing you can spend your time on. Most of the code I write today could
  be written by someone much more junior." - Joy Ebertz
- If your coding, try to pick work that's not time sensitive of on the critical path.

## Chapter 6 - Why Have We Stopped?

- "Three bullet points and a call to action" technique for asking for something from a busy executive.
- Migrations - show the progress of the work. When I shared the graph showing how many had been done and how many were
  left to do, people were more eager to do their part to get the numbers down. Something in own brains likes seeing a
  graph finish its journey to zero.
- One way you can choose a problem to solve is by choosing a stakeholder to make happy. Reorient the project around
  getting _something_ to _someone_. Aim to solve "vertical slices": first you help one stakeholder complete something,
  and then another. Progressing in _some_ direction can help break the deadlock and clarify next steps.
- Michael R. Bernstein has a great analogy for creating solutions and then not marketing them at all. He says it's like
  a farmer planting seeds, watering, weeding, and growing a crop, and then just leaving it in the field. You need to invest
  in what you grew, take it to people, and show them why they want it. The best software in the world doesn't matter if
  users don't know it exists or aren't convinced it's worth their time. You need to do the marketing.
- You don't just need to tell people that the solution exists: you need to _keep_ telling them.
- Send emails, do road shows, get a slot at the engineering all-hands. Offer white-glove service to specific customers
  who are likely to advocate for you afterwards.
- Whatever you've created, make it easy to find.

# Part III - Leveling Up

## Chapter 7 - You're a Role Model Now (Sorry)

- "Any fool can write code that a computer can understand. Good programmers write code that humans can understand." - Martin Fowler
- The longer the system is intended to last, the longer you should spend trying to make it as simple as you can.
- "The degree to which other people want to work with you is a direct indication of how successful you'll be in your
  career as an engineer. Be the engineer that everyone want to work with." - John Allspaw

## Chapter 8 - Good Influence at Scale

- Think of these tiers and mechanisms as a list of options available to you, not a checklist to try to complete.
- Play to your strengths and do the ones that you enjoy, find easy, or want to get better at.
- Don't skip past the smaller ones. Levelling up your colleagues through code review or sponsorship will have a ripple effect
  across the company.

|             | Individual                                              | Group                                       | Catalyst                                                                                                    |
| ----------- | ------------------------------------------------------- | ------------------------------------------- | ----------------------------------------------------------------------------------------------------------- |
| Advice      | Mentoring, sharing knowledge, feedback                  | Tech talks, docs, articles                  | Mentorship programs, tech talk events                                                                       |
| Teaching    | Code review, design review, coaching, paring, shadowing | Classes, codelabs                           | Onboarding curriculum, teaching people to teach                                                             |
| Guardrails  | Code review, change review, design review               | Processes, linters, style guides            | Frameworks, culture change                                                                                  |
| Opportunity | Delegation, sponsorship, cheerleading, ongoing support  | Sharing the spotlight, empowering your team | Creating a culture of opportunity, watching with pride as your superstar junior colleagues change the world |

- Neha Batra describes mentoring as "sharing your experiences so an engineer can leverage it themselves."
- Peer reviews - How could they be more awesome? If you can't think of anything, ask yourself why they aren't one level
  more senior (or two!), and give them advice on behaviors they should focus on to get there.
- Pairing, shadowing, and reverse shadowing - Here's another way you can teach: working directly with someone else.
  Working together has a spectrum if approaches, from shadowing, where you're doing all of the work with your coworker
  observing, to pairing, where you're working together, to reverse shadowing, where they're doing all the work with you
  watching to give them feedback.
  - You execute, they shadow
  - Pairing, you lead
  - Pairing, no leader or equal time leading
  - Pairing, they lead
  - They execute, you reverse shadow
- On day one, we had them send two pull requests: one to add a joke to our repository of jokes, and one to add their name
  to the list of people on the team. We would find a reason to do a little back-and-forth on this, so they'd get used to
  the code review process. On day two, we'd have them add a debug log message to production and deploy it to prove to themselves
  that they could see their change.
- Code review
  - Should this work exist?
  - Does this work actually solve the problem?
  - How will it handle failure?
  - Is it understandable?
  - Does it fit into the bigger picture?
  - Do the right people know about it?
- Sponsorship - Is using your position of influence to advocate for someone else. It's more ative than mentorship:
  you're deliberately unlocking opportunity for other people, not just giving them advise. It takes more work, too: if you
  want to be a great sponsor, you need to know what your colleague will benefit from and what opportunities they're looking
  out for.
- ABCDs of sponsorship:
  - Amplifying - Promoting your colleagues good work and making sure other people know about their accomplishments.
  - Boosting - Recommending them for opportunities and endorsing their skills.
  - Connecting - Bringing them into a network, giving them access to people they wouldn't otherwise be able to meet.
  - Defending - Standing up for them when they're unfairly criticized; changing any negative perceptions of them.

## Chapter 9 - What's Next?

- Charity Majors, CTO of Honeycomb, points out that keeping up with our fast-paced industry means managing energy:
  "If you want a sustainable career in tech, you are going to need to keep learning your whole life... Make sure that you
  a) know yourself and what makes you happy, b) spend your time mostly in alignment with that. Doing things that make you
  happy gives you energy. Doing things that drain you are antithetical to your success.
- Cate Huston offers five metrics for evaluating your job health:
  - Are you _learning_? Are you _growing_? 0: stagnant --> 5: rocketship growth
  - Are you learning _transferable skills_ or just _how to cope with your org's dysfunction?_ 0: learning to cope in _this_ org --> 5: learning transferable skills
  - How do you feel about _recruiting_ friends to your company? 0: morally conflicted --> 5: wildly enthusiastic
  - How's your _confidence_ and how _capable_ do you feel? 0: confidence being eroded --> 5: confidence growing
  - Is your job _physically good for you_? 0: stress stress stress --> 5: feeling healthy
- Molly Graham says that careers come in two phases: first learning what your strengths are, and then finding "holes that
  are shaped like you." "Happiness," Graham says, "is going to come from finding roles that fall in the intersection of
  what you love doing and what you are great at."
