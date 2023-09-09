---
layout: post
title: "An Elegant Puzzle - Will Larson"
date: 2023-08-18 09:00:00 +1000
tags: book, management
---

# Chapter 2 - Organisations

## 2.2.1 Four states of a team

Falling behind -> Add people (increase the overall capacity of the team).

- Backlog is longer than it was last week.

Treading water -> Reduce WIP (consolidate efforts to finish more things, and to reduce concurrent work until they are able to begin repaying debt).

- Able to get their critical work done but are not able to start paying down technical dept or begin major new projects.

Repaying debt -> Add time (allow the compounding value of paying down debt to grow).

- Able to start paying down technical debt and are beginning to benefit from the dept-repayment snowball; each piece of debt that you repay leads to more time to repay more debt.

Innovating -> Add slack (maintain enough slack in your team’s schedule that the team can build quality into their work, operate continuously in innovation, and avoid backtracking).

- Technical debt is sustainably low, morale is high, and the majority of work is satisfying new user needs.

## 2.5 Where to stash your organisational risk?

As an organizational leader, you’ll always have a portfolio of risk, and you’ll always be doing very badly at some things that are important to you. That’s not only okay, it’s unavoidable.

# Chapter 3 - Tools

## 3.1.1 Stocks and flows

- Big changes appear to happen in a moment, but if you look closely underneath the big change, there is usually a slow accumulation of small changes.
- These accumulations are called stocks, and are the memory of changes over time. A stock might be the number of trained managers at your company.
- Changes to stocks are called flows.
- These can be either inflows or outflows. Training a new manager is an inflow, and a trained manager who departs the company is an outflow.
- Information links indicate that the value of a stock is a factor in the size of the flow.
- You need to identify the true values of the stocks and flows. For example, if you don’t have a backlog of ready commits, then speeding up your deploy rate may not be valuable. Likewise, if your defect rate is very low, then reducing your recovery time will have little impact on the system.

## 3.2.3 Solution validation

- **Find the path more quickly traveled. The most expensive way to validate a solution is to build it in its entirety. The upside of that approach is that you’ve lost no time if you picked a good solution. The downside is that you’ve sacrificed a huge amount of time if it’s not.**

## 3.3.1 Strategies and visions

- Strategies are grounded documents that explain the trade-offs and actions that will be taken to address a specific challenge. Visions are aspirational documents that enable individuals who don’t work closely together to make decisions that fit together cleanly.

## 3.3.2 Strategy

- A strategy recommends specific actions that address a given challenge’s constraints.

## 3.4 Metrics and baselines

Defining goals

- **Good goals are a composition of four specific kinds of numbers:**

1. A target states where you want to reach.
2. A baseline identifies where are today.
3. A trend describes the current velocity.
4. A time frame sets bounds for the change.

## Investments and baselines

- There are two particularly interesting kinds of goals: investments and baselines. Investments describe a future state that you want to reach, and baselines describe aspects of the present that you want to preserve.
- Imagine you wanted to speed up a pipeline. You could likely reach that goal tomorrow by doubling the size of the your cluster, which is probably not a desirable outcome.
- The best way to avoid such unintended outcomes is to **pair your investment goals with baseline metrics**, sometimes referred to as countervailing metrics. E.g. Efficiency of running core batch jobs should not exceed current price of $0.05 per GB.

## 3.5 Guiding organisational change with metrics

- Infrastructure cost is a great example of a baseline metric. When you’re asked to take responsibility for a company’s overall infrastructure costs, you’re going to start from a goal along the lines of **“Maintain infrastructure costs at their current percentage of net revenue of 30%.” That percentage is fictional… But I have found that tying it against net revenue is more useful that pinning is at a specific dollar amount.**
- What I’ve found effective is to send push notifications, typically emails, to teams whose metrics have changed recently, both in terms of absolute change and in terms of their benchmarked performance against their cohort.
- What’s so powerful about nudges is that simply letting folks know their behaviour has changed will typically stir them to action, and it doesn’t require any sort of organisational authority to do so.

## 3.6.2 Running good migrations

De-risk

- After you’ve evolved the design, the next step is to embed into the most challenging one or two teams. **Don’t start with the easiest migrations, which can lead to a false sense of security.**

Finish

- Start by stopping the bleeding, which is ensuring that all newly written code uses the new approach. That can be installing a ratchet in your linters, or updating your documentation and self-service tooling.
- This is always the first step, because it turns time into your friend. Instead of falling behind by default, you’re now making progress by default.

## 3.8 Identifying your controls

Common controls:

- Metrics
- Visions
- Strategies
- Organisation design
- Headcount and transfers
- Roadmaps
- Performance reviews etc

For whatever controls you pick, the second step is to agree on the degree of alignment for each one. Some of the levels that I’ve found useful are:

- I’ll do it.
- Preview - I’d like to be involved early and often.
- Review - I’d like to weigh in before it gets published.
- Notes - Projects I’d like to follow but don’t have much I can add.
- No surprises - Require updates to keep my mental model intact.
- Let me know - Let me know if something comes up, but otherwise I’m totally confident it’ll go well.

# Chapter 4 - Approaches

## 4.3.3 People over process

- “With the right people, any process works, and with the wrong people, no process works.”

## 4.7 Finding managerial scope

- You can always find an opportunity to increase your scope and learning, even in a company that doesn’t have room for more directors or vice presidents.

## 4.9 Close out, solve or delegate

- For every problems that comes your way, you must pick one of three options:
- Close out - Close it out in such a way that this specific ask is entirely resolved
- Solve - Design a solution such that you won’t need to spend time on this particular kind of ask again in the next six months.
- Delegate - Redirect the ask to someone who is responsible for that kind of work.
- No matter what problem comes your way, you’re not allowed to solve it any other way. Give this method a try for a week, and see if it helps you navigate your role more effectively.

# Chapter 5 - Culture

## 5.1.2 Membership

- Reoccurring weekly events allow coworkers to interact socially. These are held during working hours, are open to folks from many different teams to attend, and are optional.

## 5.3 Make your peers your first team

- As you move into larger roles, you’ll need to start considering challenges from the perspectives of more teams and people. In this sense, treating your peers as your first team allows you to begin practicing your manager’s job, without having to get promoted into the role first.

## 5.5 Company culture and managing freedoms

- “Freedom” is neither inherently good nor inherently just. Each positive freedom we enforce strips away a negative freedom, and each negative freedom we guarantee eliminates a corresponding positive freedom.
- During success, we can carefully ramp toward negative freedom and away from positive freedom.
- Further down the road, if the structure loses its lustre, the economy shifts around us, or entropy’s endless march throws a wrench into the machinery, then once again we shift toward positive freedoms, which gives the organisation a greater change to successfully adapt to its new circumstances.
- Using the two together, management slowly decelerates to keep the good times rolling, and accelerates to help push through challenging periods.

# Chapter 6 - Careers

## 6.7.1 Challenges

Brittle organisations

- As you move away from generalised roles and toward specialists, and unexpected consequence is that your organisation has far more single points of failure.

Roles too “trivial” to promote

- You’ll often find that the work done by new roles is valued very highly in terms of impact, but not viewed as sufficiently “strategic” to merit promotion, particularly beyond career level. This can lead to individuals being obligated to change roles if they want to attain higher tiers of achievement.

## 6.7.2 Facilitating success

- Self-sustaining mission. New roles are frequently described in terms of how they’ll impact other functions, rather than in terms of what they’ll accomplish. For example, you might describe technical program managers as offloading project management responsibilities from engineering managers. This approach frames the roles as an auxiliary support function, which makes it difficult to recognise the work’s impact. You must be able to frame the role’s work without referencing other existing roles in order for it to succeed long-term.
- Career-ladder. In pretty much all cases, new roles should have a career ladder from the beginning. The career ladder is the foundation of a successful performance management system, and it’s not possible for a role to be valued or evaluated coherently without a thoughtful career ladder.

## 6.8 Designing an interview loop

Don’t hire for potential. Hiring for potential is a major vector for bias, and you should try and avoid it. If you do decide to include potential, then spend time developing an objective rubric for potential, and ensure that the signals it indexes on are consistently discoverable.
