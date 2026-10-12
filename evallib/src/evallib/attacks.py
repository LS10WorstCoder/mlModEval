import torch
import torch.nn.functional as F


def fgsm(
    model: torch.nn.Module,
    x: torch.Tensor,
    y: torch.Tensor,
    eps: float,
) -> torch.Tensor:
    #FOR EFFICIENCY PRUPOSES I dont want a graph being built on the callers tensor as it would stay enabled unless turned
    #off taking up compute and memory and turtning it off at the end of function wouldn't restore the tensor to its orignial state
    x_adv = x.detach().clone()

    #set autograd for ability to derivate
    x_adv.requires_grad_(True)

    logits = model(x_adv)
    #cross entropy for loss func
    loss = F.cross_entropy(logits, y)


    gradients = torch.autograd.grad(loss, x_adv)
    #gradient of the input b4 changes (first autograd graph node)
    input_gradient = gradients[0]

    #move every pixel by exactly eps in the direction that increases the loss.
    perturbation = eps * input_gradient.sign()
    x_adv = x_adv.detach() + perturbation

    #like relu clamp all values to 0,1 neg goes to 0 pos >1 goes to 1
    x_adv = x_adv.clamp(0.0, 1.0)

    return x_adv